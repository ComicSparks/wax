import 'dart:async';
import 'dart:io';

import 'package:another_xlider/another_xlider.dart';
import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wax/protos/properties.pb.dart';
import '../../basic/methods.dart';
import '../../configs/reader_controller_type.dart';
import '../../configs/reader_direction.dart';
import '../../configs/reader_scroll_by_screen_percentage.dart';
import '../../configs/reader_slider_position.dart';
import '../../configs/reader_two_page_direction.dart';
import '../../configs/reader_type.dart';
import '../../configs/reader_zoom_scale.dart';
import '../../configs/two_page_direction.dart';
import '../configs/full_screen_page_number.dart';
import '../configs/drag_region_lock.dart';
import '../configs/gesture_speed.dart';
import '../configs/no_reader_anime.dart';
import '../configs/volume_controller.dart';
import './components/content_error.dart';
import './components/content_loading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mbs;
import 'package:photo_view/photo_view_gallery.dart';
import 'package:zoomable_positioned_list/zoomable_positioned_list.dart' as zoomable;

import 'components/images.dart';
import '../configs/webtoon_scroll_mode.dart';

class ComicReaderScreen extends StatefulWidget {
  final ComicSimple comic;
  final int initRank;
  final bool fullScreenOnInit;
  final Future<ComicPagesResult> Function() loadResult;

  const ComicReaderScreen({
    Key? key,
    required this.comic,
    required this.loadResult,
    this.initRank = 0,
    this.fullScreenOnInit = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicReaderScreenState();
}

class _ComicReaderScreenState extends State<ComicReaderScreen> {
  late ReaderType _readerType;
  late ReaderDirection _readerDirection;
  late Future<ComicPagesResult> _resultFuture;

  void _load() {
    setState(() {
      _readerType = currentReaderType;
      _readerDirection = currentReaderDirection;
      _resultFuture = widget.loadResult();
    });
  }

  @override
  void initState() {
    methods.updateViewLog(widget.comic.id, widget.initRank);
    _load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _resultFuture,
      builder:
          (BuildContext context, AsyncSnapshot<ComicPagesResult> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(),
            body: ContentError(
              onRefresh: () async {
                setState(() {
                  _resultFuture = widget.loadResult();
                });
              },
              error: snapshot.error,
              stackTrace: snapshot.stackTrace,
            ),
          );
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(),
            body: const ContentLoading(),
          );
        }
        final screen = Scaffold(
          backgroundColor: Colors.black,
          body: _ComicReader(
            comic: widget.comic,
            pagesResult: snapshot.requireData,
            startIndex: widget.initRank,
            reload: (int index, bool fullScreen) async {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) {
                  return ComicReaderScreen(
                    loadResult: widget.loadResult,
                    comic: widget.comic,
                    initRank: index,
                    fullScreenOnInit: fullScreen,
                  );
                }),
              );
            },
            readerType: _readerType,
            readerDirection: _readerDirection,
            fullScreenOnInit: widget.fullScreenOnInit,
          ),
        );
        return readerKeyboardHolder(screen);
      },
    );
  }
}

////////////////////////////////

// 仅支持安卓
// 监听后会拦截安卓手机音量键
// 仅最后一次监听生效
// event可能为DOWN/UP

var _volumeListenCount = 0;

void _onVolumeEvent(dynamic args) {
  _readerControllerEvent.broadcast(_ReaderControllerEventArgs("$args"));
}

EventChannel volumeButtonChannel = const EventChannel("volume_button");
StreamSubscription? volumeS;

void addVolumeListen() {
  _volumeListenCount++;
  if (_volumeListenCount == 1) {
    volumeS =
        volumeButtonChannel.receiveBroadcastStream().listen(_onVolumeEvent);
  }
}

void delVolumeListen() {
  _volumeListenCount--;
  if (_volumeListenCount == 0) {
    volumeS?.cancel();
  }
}

Widget readerKeyboardHolder(Widget widget) {
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    widget = RawKeyboardListener(
      focusNode: FocusNode(),
      child: widget,
      autofocus: true,
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            _readerControllerEvent.broadcast(_ReaderControllerEventArgs("UP"));
          }
          if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            _readerControllerEvent
                .broadcast(_ReaderControllerEventArgs("DOWN"));
          }
        }
      },
    );
  }
  return widget;
}

////////////////////////////////

bool noAnimation() => noReaderAnime;

Event<_ReaderControllerEventArgs> _readerControllerEvent =
    Event<_ReaderControllerEventArgs>();

class _ReaderControllerEventArgs extends EventArgs {
  final String key;

  _ReaderControllerEventArgs(this.key);
}

class _ComicReader extends StatefulWidget {
  final ComicSimple comic;
  final ComicPagesResult pagesResult;
  final FutureOr Function(int, bool) reload;
  final int startIndex;
  final ReaderType readerType;
  final ReaderDirection readerDirection;
  final bool fullScreenOnInit;

  const _ComicReader({
    required this.comic,
    required this.pagesResult,
    required this.reload,
    required this.startIndex,
    required this.readerType,
    required this.readerDirection,
    required this.fullScreenOnInit,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    switch (readerType) {
      case ReaderType.webtoon:
        return _ComicReaderWebToonState();
      case ReaderType.gallery:
        return _ComicReaderGalleryState();
      case ReaderType.webToonFreeZoom:
        return _ListViewReaderState();
      case ReaderType.twoPageGallery:
        return _ComicReaderTwoPageGalleryState();
    }
  }
}

abstract class _ComicReaderState extends State<_ComicReader> {
  Widget _buildViewer();

  _needJumpTo(int pageIndex, bool animation);

  void _needScrollForward() {
    if (_current < widget.pagesResult.pages.length - 1) {
      _needJumpTo(_current + 1, !noAnimation());
    }
  }

  void _needScrollBackward() {
    if (_current > 0) {
      _needJumpTo(_current - 1, !noAnimation());
    }
  }

  late final bool _listVolume = volumeController;
  late bool _fullScreen;
  late int _current;
  late int _slider;

  Future _onFullScreenChange(bool fullScreen) async {
    setState(() {
      SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.manual, overlays: fullScreen ? [] : SystemUiOverlay.values);
      _fullScreen = fullScreen;
    });
  }

  void _onCurrentChange(int index) {
    if (index != _current) {
      setState(() {
        _current = index;
        _slider = index;
        var _ = methods.updateViewLog(
          widget.comic.id,
          index,
        ); // 在后台线程入库
      });
    }
  }

  @override
  void initState() {
    _fullScreen = widget.fullScreenOnInit;
    if (_fullScreen) {
      if (Platform.isAndroid || Platform.isIOS) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      }
    }
    _current = widget.startIndex;
    _slider = widget.startIndex;
    _readerControllerEvent.subscribe(_onPageControl);
    if (_listVolume) {
      addVolumeListen();
    }
    super.initState();
  }

  @override
  void dispose() {
    _readerControllerEvent.unsubscribe(_onPageControl);
    if (_listVolume) {
      delVolumeListen();
    }
    if (Platform.isAndroid || Platform.isIOS) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    }
    super.dispose();
  }

  void _onPageControl(_ReaderControllerEventArgs? args) {
    if (args != null) {
      var event = args.key;
      final isWebToonReader =
          currentReaderType == ReaderType.webtoon ||
              currentReaderType == ReaderType.webToonFreeZoom;
      final step = currentReaderType == ReaderType.twoPageGallery ? 2 : 1;
      switch (event) {
        case "UP":
          if (isWebToonReader &&
              currentWebToonScrollMode == WebToonScrollMode.screen) {
            _needScrollBackward();
            break;
          }
          if (_current > 0) {
            var target = _current - step;
            if (target < 0) target = 0;
            _needJumpTo(target, !noAnimation());
          }
          break;
        case "DOWN":
          if (isWebToonReader &&
              currentWebToonScrollMode == WebToonScrollMode.screen) {
            _needScrollForward();
            break;
          }
          if (_current < widget.pagesResult.pages.length - 1) {
            var target = _current + step;
            final max = widget.pagesResult.pages.length - 1;
            if (target > max) target = max;
            _needJumpTo(target, !noAnimation());
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildControllerBody(),
        IgnorePointer(child: _buildFullScreenPageFloating()),
      ],
    );
  }

  Widget _buildControllerBody() {
    switch (currentReaderControllerType) {
      // 按钮
      case ReaderControllerType.controller:
        return Stack(
          children: [
            _buildViewer(),
            _buildBar(_buildFullScreenControllerStackItem()),
          ],
        );
      case ReaderControllerType.touchOnce:
        return Stack(
          children: [
            _buildTouchOnceControllerAction(_buildViewer()),
            _buildBar(Container()),
          ],
        );
      case ReaderControllerType.touchDouble:
        return Stack(
          children: [
            _buildTouchDoubleControllerAction(_buildViewer()),
            _buildBar(Container()),
          ],
        );
      case ReaderControllerType.touchDoubleOnceNext:
        return Stack(
          children: [
            _buildTouchDoubleOnceNextControllerAction(_buildViewer()),
            _buildBar(Container()),
          ],
        );
      case ReaderControllerType.threeArea:
        return Stack(
          children: [
             _buildViewer(),
            _buildBar(_buildThreeAreaControllerAction()),
          ],
        );
    }
  }

  Widget _buildFullScreenPageFloating() {
    if (!_fullScreen || !fullScreenShowPageNumber) {
      return Container();
    }

    Alignment alignment;
    EdgeInsets margin;
    switch (fullScreenPageNumberPosition) {
      case FullScreenPageNumberPosition.topLeft:
        alignment = Alignment.topLeft;
        margin = const EdgeInsets.only(top: 14, left: 10);
        break;
      case FullScreenPageNumberPosition.bottomLeft:
        alignment = Alignment.bottomLeft;
        margin = const EdgeInsets.only(bottom: 14, left: 10);
        break;
      case FullScreenPageNumberPosition.topRight:
        alignment = Alignment.topRight;
        margin = const EdgeInsets.only(top: 14, right: 10);
        break;
      case FullScreenPageNumberPosition.bottomRight:
        alignment = Alignment.bottomRight;
        margin = const EdgeInsets.only(bottom: 14, right: 10);
        break;
    }

    return SafeArea(
      child: Align(
        alignment: alignment,
        child: Container(
          margin: margin,
          padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
          decoration: BoxDecoration(
            color: const Color(0x66000000),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            "${_current + 1} / ${widget.pagesResult.pages.length}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              height: 1.1,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullScreenControllerStackItem() {
    if (currentReaderSliderPosition == ReaderSliderPosition.bottom &&
        !_fullScreen) {
      return Container();
    }
    if (currentReaderSliderPosition == ReaderSliderPosition.right) {
      return SafeArea(child: Align(
        alignment: Alignment.bottomRight,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding:
            const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0x88000000),
            ),
            child: GestureDetector(
              onTap: () {
                _onFullScreenChange(!_fullScreen);
              },
              child: Icon(
                _fullScreen ? Icons.fullscreen_exit : Icons.fullscreen_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ));
    }
    return SafeArea(child: Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding:
          const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color(0x88000000),
          ),
          child: GestureDetector(
            onTap: () {
              _onFullScreenChange(!_fullScreen);
            },
            child: Icon(
              _fullScreen ? Icons.fullscreen_exit : Icons.fullscreen_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ));
  }

  Widget _buildTouchOnceControllerAction(Widget child) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _onFullScreenChange(!_fullScreen);
      },
      child: child,
    );
  }

  Widget _buildTouchDoubleControllerAction(Widget child) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onDoubleTap: () {
        _onFullScreenChange(!_fullScreen);
      },
      child: child,
    );
  }

  Widget _buildTouchDoubleOnceNextControllerAction(Widget child) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _readerControllerEvent.broadcast(_ReaderControllerEventArgs("DOWN"));
      },
      onDoubleTap: () {
        _onFullScreenChange(!_fullScreen);
      },
      child: child,
    );
  }

  Widget _buildThreeAreaControllerAction() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var up = Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _readerControllerEvent
                  .broadcast(_ReaderControllerEventArgs("UP"));
            },
            child: Container(),
          ),
        );
        var down = Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              _readerControllerEvent
                  .broadcast(_ReaderControllerEventArgs("DOWN"));
            },
            child: Container(),
          ),
        );
        var fullScreen = Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _onFullScreenChange(!_fullScreen),
            child: Container(),
          ),
        );
        late Widget child;
        switch (currentReaderDirection) {
          case ReaderDirection.topToBottom:
            child = Column(children: [
              up,
              fullScreen,
              down,
            ]);
            break;
          case ReaderDirection.leftToRight:
            child = Row(children: [
              up,
              fullScreen,
              down,
            ]);
            break;
          case ReaderDirection.rightToLeft:
            child = Row(children: [
              down,
              fullScreen,
              up,
            ]);
            break;
        }
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: child,
        );
      },
    );
  }

  Widget _buildBar(Widget child) {
    switch (currentReaderSliderPosition) {
      case ReaderSliderPosition.bottom:
        return Column(
          children: [
            _buildAppBar(),
            Expanded(child: child),
            _fullScreen
                ? Container()
                : Container(
                    height: 45,
                    color: const Color(0x88000000),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: 15),
                        IconButton(
                          icon: const Icon(Icons.fullscreen),
                          color: Colors.white,
                          onPressed: () {
                            _onFullScreenChange(!_fullScreen);
                          },
                        ),
                        Container(width: 10),
                        Expanded(
                          child: widget.readerType != ReaderType.webToonFreeZoom
                              ? _buildSliderBottom()
                              : Container(),
                        ),
                        Container(width: 10),
                        IconButton(
                          icon: const Icon(Icons.skip_next_outlined),
                          color: Colors.white,
                          onPressed: _onCloseAction,
                        ),
                        Container(width: 15),
                      ],
                    ),
                  ),
            _fullScreen
                ? Container()
                : Container(
              color: const Color(0x88000000),
              child: SafeArea(
                top: false,
                child: Container(),
              ),
            ),
          ],
        );
      case ReaderSliderPosition.right:
        return Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Stack(
                children: [
                  child,
                  _buildSliderRight(),
                ],
              ),
            ),
          ],
        );
      case ReaderSliderPosition.left:
        return Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Stack(
                children: [
                  child,
                  _buildSliderLeft(),
                ],
              ),
            ),
          ],
        );
    }
  }

  Widget _buildAppBar() => _fullScreen
      ? Container()
      : AppBar(
          title: Text(widget.comic.title),
          actions: [
            IconButton(
              onPressed: _onMoreSetting,
              icon: const Icon(Icons.more_horiz),
            ),
          ],
        );

  Widget _buildSliderBottom() {
    return Column(
      children: [
        Expanded(child: Container()),
        SizedBox(
          height: 25,
          child: _buildSliderWidget(Axis.horizontal),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  Widget _buildSliderLeft() => _fullScreen
      ? Container()
      : Align(
          alignment: Alignment.centerLeft,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 35,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 5),
              child: Center(
                child: _buildSliderWidget(Axis.vertical),
              ),
            ),
          ),
        );

  Widget _buildSliderRight() => _fullScreen
      ? Container()
      : Align(
          alignment: Alignment.centerRight,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 35,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              padding:
                  const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 6),
              child: Center(
                child: _buildSliderWidget(Axis.vertical),
              ),
            ),
          ),
        );

  Widget _buildSliderWidget(Axis axis) {
    return FlutterSlider(
      axis: axis,
      values: [_slider.toDouble()],
      min: 0,
      max: (widget.pagesResult.pages.length - 1).toDouble(),
      onDragging: (handlerIndex, lowerValue, upperValue) {
        _slider = (lowerValue.toInt());
      },
      onDragCompleted: (handlerIndex, lowerValue, upperValue) {
        _slider = (lowerValue.toInt());
        if (_slider != _current) {
          _needJumpTo(_slider, false);
        }
      },
      trackBar: FlutterSliderTrackBar(
        inactiveTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        activeTrackBar: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      step: const FlutterSliderStep(
        step: 1,
        isPercentRange: false,
      ),
      tooltip: FlutterSliderTooltip(custom: (value) {
        double a = value + 1;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: Colors.black.withAlpha(0xCC),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(3)),
          ),
          child: Text(
            '${a.toInt()}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        );
      }),
    );
  }

  //
  _onMoreSetting() async {
    await mbs.showMaterialModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xAA000000),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: _SettingPanel(),
        );
      },
    );
    if (widget.readerDirection != currentReaderDirection ||
        widget.readerType != currentReaderType) {
      widget.reload(_current, _fullScreen);
    } else {
      setState(() {});
    }
  }

  void _onCloseAction() {
    Navigator.of(context).pop();
  }

  //
  double _appBarHeight() {
    return Scaffold.of(context).appBarMaxHeight ?? 0;
  }

  double _bottomBarHeight() {
    return 45;
  }

  bool _fullscreenController() {
    switch (currentReaderControllerType) {
      case ReaderControllerType.touchOnce:
        return false;
      case ReaderControllerType.controller:
        return false;
      case ReaderControllerType.touchDouble:
        return false;
      case ReaderControllerType.touchDoubleOnceNext:
        return false;
      case ReaderControllerType.threeArea:
        return true;
    }
  }
}

class _SettingPanel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPanelState();
}

class _SettingPanelState extends State<_SettingPanel> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: [
            _bottomIcon(
              icon: Icons.crop_sharp,
              title: readerDirectionName(currentReaderDirection, context),
              onPressed: () async {
                await chooseReaderDirection(context);
                setState(() {});
              },
            ),
            _bottomIcon(
              icon: Icons.view_day_outlined,
              title: readerTypeName(currentReaderType, context),
              onPressed: () async {
                await chooseReaderType(context);
                setState(() {});
              },
            ),
            _bottomIcon(
              icon: Icons.control_camera_outlined,
              title: currentReaderControllerTypeName(),
              onPressed: () async {
                await chooseReaderControllerType(context);
                setState(() {});
              },
            ),
            _bottomIcon(
              icon: Icons.straighten_sharp,
              title: currentReaderSliderPositionName,
              onPressed: () async {
                await chooseReaderSliderPosition(context);
                setState(() {});
              },
            ),
          ],
        ),
        if (currentReaderType == ReaderType.twoPageGallery) ...[
          ListTile(
            title: const Text(
              "双页方向",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              twoPageDirectionName(currentTwoPageDirection),
              style: const TextStyle(color: Colors.white70),
            ),
            onTap: () async {
              await chooseTwoPageDirection(context);
              setState(() {});
            },
          ),
          ListTile(
            title: const Text(
              "双页排列",
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              readerTwoPageDirectionName(currentReaderTwoPageDirection),
              style: const TextStyle(color: Colors.white70),
            ),
            onTap: () async {
              await chooseReaderTwoPageDirection(context);
              setState(() {});
            },
          ),
        ],
        if (currentReaderType == ReaderType.webtoon ||
            currentReaderType == ReaderType.webToonFreeZoom)
          ...[
            ListTile(
              title: const Text(
                "WebToon 滚动方式",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                webToonScrollModeName(currentWebToonScrollMode),
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () async {
                await chooseWebToonScrollMode(context);
                setState(() {});
              },
            ),
            ListTile(
              title: Text(
                "按距离翻页长度 : ${currentReaderScrollByScreenPercentage}%屏幕",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Slider(
                min: 5,
                max: 110,
                divisions: 105,
                value: currentReaderScrollByScreenPercentage.toDouble(),
                onChanged: (double value) async {
                  await setReaderScrollByScreenPercentage(value.toInt());
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text(
                "缩小倍数 : ${readerZoomMinScale.toStringAsFixed(1)}x",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Slider(
                min: 0.1,
                max: 1.0,
                divisions: 9,
                value: readerZoomMinScale.clamp(0.1, 1.0),
                onChanged: (double value) async {
                  final newValue = (value * 10).roundToDouble() / 10;
                  await setReaderZoomMinScale(newValue);
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text(
                "放大倍数 : ${readerZoomMaxScale.toStringAsFixed(1)}x",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Slider(
                min: 1.0,
                max: 30.0,
                divisions: 29,
                value: readerZoomMaxScale.clamp(1.0, 30.0),
                onChanged: (double value) async {
                  final newValue = value.roundToDouble();
                  await setReaderZoomMaxScale(newValue);
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text(
                "双击缩放倍数 : ${readerZoomDoubleTapScale.toStringAsFixed(1)}x",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Slider(
                min: 1.5,
                max: 5.0,
                divisions: 7,
                value: readerZoomDoubleTapScale.clamp(1.5, 5.0),
                onChanged: (double value) async {
                  final newValue = (value * 2).roundToDouble() / 2;
                  await setReaderZoomDoubleTapScale(newValue);
                  setState(() {});
                },
              ),
            ),
            SwitchListTile(
              value: dragRegionLock,
              title: const Text(
                "锁定拖动边界",
                style: TextStyle(color: Colors.white),
              ),
              onChanged: (target) async {
                await setDragRegionLock(target);
                setState(() {});
              },
            ),
            ListTile(
              title: Text(
                "手势速度倍率 : ${currentGestureSpeed.toStringAsFixed(1)}x",
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Slider(
                min: 0.1,
                max: 5.0,
                divisions: 49,
                value: currentGestureSpeed.clamp(0.1, 5.0),
                onChanged: (double value) async {
                  final newValue = (value * 10).roundToDouble() / 10;
                  await setGestureSpeed(newValue);
                  setState(() {});
                },
              ),
            ),
          ],
      ],
    );
  }

  Widget _bottomIcon({
    required IconData icon,
    required String title,
    required void Function() onPressed,
  }) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            IconButton(
              iconSize: 55,
              icon: Column(
                children: [
                  Container(height: 3),
                  Icon(
                    icon,
                    size: 25,
                    color: Colors.white,
                  ),
                  Container(height: 3),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  Container(height: 3),
                ],
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}

class _ComicReaderWebToonState extends _ComicReaderState {
  var _controllerTime = DateTime.now().millisecondsSinceEpoch + 400;
  late final List<Size?> _trueSizes = [];
  late final zoomable.ItemScrollController _itemScrollController;
  late final zoomable.ItemPositionsListener _itemPositionsListener;
  late final zoomable.ScrollOffsetController _scrollOffsetController;
  late final zoomable.ScrollOffsetListener _scrollOffsetListener;
  StreamSubscription<double>? _scrollOffsetSubscription;

  @override
  void initState() {
    for (var e in widget.pagesResult.pages) {
      _trueSizes.add(null);
    }
    _itemScrollController = zoomable.ItemScrollController();
    _itemPositionsListener = zoomable.ItemPositionsListener.create();
    _itemPositionsListener.itemPositions.addListener(_onListCurrentChange);
    _scrollOffsetController = zoomable.ScrollOffsetController();
    _scrollOffsetListener = zoomable.ScrollOffsetListener.create();
    _scrollOffsetSubscription = _scrollOffsetListener.changes.listen((_) {});
    super.initState();
  }

  @override
  void dispose() {
    _itemPositionsListener.itemPositions.removeListener(_onListCurrentChange);
    _scrollOffsetSubscription?.cancel();
    super.dispose();
  }

  void _onListCurrentChange() {
    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) {
      return;
    }
    var to = positions.first.index;
    // 包含一个下一章, 假设5张图片 0,1,2,3,4 length=5, 下一章=5
    if (to >= 0 && to < widget.pagesResult.pages.length) {
      super._onCurrentChange(to);
    }
  }

  double _screenStepSize() {
    if (widget.readerDirection == ReaderDirection.topToBottom) {
      return MediaQuery.of(context).size.height * readerScrollByScreenPercentage;
    }
    return MediaQuery.of(context).size.width * readerScrollByScreenPercentage;
  }

  @override
  void _needJumpTo(int index, bool animation) {
    if (noAnimation() || animation == false) {
      _itemScrollController.jumpTo(
        index: index,
      );
    } else {
      if (DateTime.now().millisecondsSinceEpoch < _controllerTime) {
        return;
      }
      _controllerTime = DateTime.now().millisecondsSinceEpoch + 400;
      _itemScrollController.scrollTo(
        index: index, // 减1 当前position 再减少1 前一个
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  @override
  void _needScrollForward() {
    _scrollOffsetController.animateScroll(
      offset: _screenStepSize(),
      duration: noAnimation() ? Duration.zero : const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void _needScrollBackward() {
    _scrollOffsetController.animateScroll(
      offset: -_screenStepSize(),
      duration: noAnimation() ? Duration.zero : const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget _buildViewer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // reload _images size
        List<Widget> _images = [];
        for (var index = 0; index < widget.pagesResult.pages.length; index++) {
          late Size renderSize;
          if (_trueSizes[index] != null) {
            if (widget.readerDirection == ReaderDirection.topToBottom) {
              renderSize = Size(
                constraints.maxWidth,
                constraints.maxWidth *
                    _trueSizes[index]!.height /
                    _trueSizes[index]!.width,
              );
            } else {
              var maxHeight = constraints.maxHeight -
                  super._appBarHeight() -
                  (super._fullScreen
                      ? super._appBarHeight()
                      : super._bottomBarHeight());
              renderSize = Size(
                maxHeight *
                    _trueSizes[index]!.width /
                    _trueSizes[index]!.height,
                maxHeight,
              );
            }
          } else {
            if (widget.readerDirection == ReaderDirection.topToBottom) {
              renderSize = Size(constraints.maxWidth, constraints.maxWidth / 2);
            } else {
              // ReaderDirection.LEFT_TO_RIGHT
              // ReaderDirection.RIGHT_TO_LEFT
              renderSize =
                  Size(constraints.maxWidth / 2, constraints.maxHeight);
            }
          }
          var currentIndex = index;
          onTrueSize(Size size) {
            setState(() {
              _trueSizes[currentIndex] = size;
            });
          }

          _images.add(
            ComicImage(
              url: widget.pagesResult.pages[index].url,
              width: renderSize.width,
              height: renderSize.height,
              onTrueSize: onTrueSize,
            ),
          );
        }
        return zoomable.ZoomablePositionedList.builder(
          enableZoom: false,
          gestureSpeed: currentGestureSpeed,
          dragRegionLock: dragRegionLock,
          scrollOffsetController: _scrollOffsetController,
          scrollOffsetListener: _scrollOffsetListener,
          initialScrollIndex: widget.startIndex,
          scrollDirection: widget.readerDirection == ReaderDirection.topToBottom
              ? Axis.vertical
              : Axis.horizontal,
          reverse: widget.readerDirection == ReaderDirection.rightToLeft,
          padding: EdgeInsets.only(
            // 不管全屏与否, 滚动方向如何, 顶部永远保持间距
            top: super._appBarHeight(),
            bottom: widget.readerDirection == ReaderDirection.topToBottom
                ? 130 // 纵向滚动 底部永远都是130的空白
                : ( // 横向滚动
                    super._fullScreen
                        ? super._appBarHeight() // 全屏时底部和顶部到屏幕边框距离一样保持美观
                        : super._bottomBarHeight())
            // 非全屏时, 顶部去掉顶部BAR的高度, 底部去掉底部BAR的高度, 形成看似填充的效果
            ,
          ),
          itemScrollController: _itemScrollController,
          itemPositionsListener: _itemPositionsListener,
          itemCount: widget.pagesResult.pages.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (widget.pagesResult.pages.length == index) {
              return _buildNextEp();
            }
            return _images[index];
          },
        );
      },
    );
  }

  Widget _buildNextEp() {
    if (super._fullscreenController()) {
      return Container();
    }
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        onPressed: super._onCloseAction,
        textColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(top: 40, bottom: 40),
          child: const Text('结束阅读'),
        ),
      ),
    );
  }
}

class _ComicReaderGalleryState extends _ComicReaderState {
  late PageController _pageController;
  late PhotoViewGallery _gallery;

  bool get _disableGalleryGestures =>
      currentReaderControllerType == ReaderControllerType.touchDouble ||
      currentReaderControllerType == ReaderControllerType.touchDoubleOnceNext;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.startIndex);
    _gallery = PhotoViewGallery.builder(
      scrollDirection: widget.readerDirection == ReaderDirection.topToBottom
          ? Axis.vertical
          : Axis.horizontal,
      reverse: widget.readerDirection == ReaderDirection.rightToLeft,
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      loadingBuilder: (context, event) => LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return buildLoading(constraints.maxWidth, constraints.maxHeight);
        },
      ),
      pageController: _pageController,
      onPageChanged: _onGalleryPageChange,
      itemCount: widget.pagesResult.pages.length,
      allowImplicitScrolling: true,
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          disableGestures: _disableGalleryGestures,
          filterQuality: FilterQuality.high,
          imageProvider: ComicImageProvider(
            url: widget.pagesResult.pages[index].url,
          ),
          errorBuilder: (b, e, s) {
            print("$e,$s");
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return buildError(constraints.maxWidth, constraints.maxHeight);
              },
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget _buildViewer() {
    return Column(
      children: [
        Container(height: _fullScreen ? 0 : super._appBarHeight()),
        Expanded(
          child: Stack(
            children: [
              _gallery,
              _buildNextEpController(),
            ],
          ),
        ),
        Container(height: _fullScreen ? 0 : super._bottomBarHeight()),
      ],
    );
  }

  @override
  _needJumpTo(int pageIndex, bool animation) {
    if (!noAnimation() && animation) {
      _pageController.animateToPage(
        pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      _pageController.jumpToPage(pageIndex);
    }
  }

  void _onGalleryPageChange(int to) {
    super._onCurrentChange(to);
  }

  Widget _buildNextEpController() {
    if (super._fullscreenController()) {
      return Container();
    }
    if (_current < widget.pagesResult.pages.length - 1) return Container();
    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Color(0x88000000),
          ),
          child: GestureDetector(
            onTap: super._onCloseAction,
            child: const Text(
              '结束阅读',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _ListViewReaderState extends _ComicReaderState
    with SingleTickerProviderStateMixin {
  final List<Size?> _trueSizes = [];
  var _controllerTime = DateTime.now().millisecondsSinceEpoch + 400;
  late final zoomable.ItemScrollController _itemScrollController;
  late final zoomable.ItemPositionsListener _itemPositionsListener;
  late final zoomable.ScrollOffsetController _scrollOffsetController;
  late final zoomable.ScrollOffsetListener _scrollOffsetListener;
  StreamSubscription<double>? _scrollOffsetSubscription;

  @override
  void initState() {
    for (var e in widget.pagesResult.pages) {
      _trueSizes.add(null);
    }
    _itemScrollController = zoomable.ItemScrollController();
    _itemPositionsListener = zoomable.ItemPositionsListener.create();
    _itemPositionsListener.itemPositions.addListener(_onListCurrentChange);
    _scrollOffsetController = zoomable.ScrollOffsetController();
    _scrollOffsetListener = zoomable.ScrollOffsetListener.create();
    _scrollOffsetSubscription = _scrollOffsetListener.changes.listen((_) {});
    super.initState();
  }

  @override
  void dispose() {
    _itemPositionsListener.itemPositions.removeListener(_onListCurrentChange);
    _scrollOffsetSubscription?.cancel();
    super.dispose();
  }

  @override
  void _needJumpTo(int index, bool animation) {
    if (noAnimation() || animation == false) {
      _itemScrollController.jumpTo(index: index);
    } else {
      if (DateTime.now().millisecondsSinceEpoch < _controllerTime) {
        return;
      }
      _controllerTime = DateTime.now().millisecondsSinceEpoch + 400;
      _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  double _screenStepSize() {
    if (currentReaderDirection == ReaderDirection.topToBottom) {
      return MediaQuery.of(context).size.height * readerScrollByScreenPercentage;
    }
    return MediaQuery.of(context).size.width * readerScrollByScreenPercentage;
  }

  @override
  void _needScrollForward() {
    _scrollOffsetController.animateScroll(
      offset: _screenStepSize(),
      duration: noAnimation() ? Duration.zero : const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  void _needScrollBackward() {
    _scrollOffsetController.animateScroll(
      offset: -_screenStepSize(),
      duration: noAnimation() ? Duration.zero : const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  void _onListCurrentChange() {
    final positions = _itemPositionsListener.itemPositions.value;
    if (positions.isEmpty) {
      return;
    }
    final to = positions.first.index;
    if (to >= 0 && to < widget.pagesResult.pages.length) {
      super._onCurrentChange(to);
    }
  }

  @override
  Widget _buildViewer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // reload _images size
        List<Widget> _images = [];
        for (var index = 0; index < widget.pagesResult.pages.length; index++) {
          late Size renderSize;
          if (_trueSizes[index] != null) {
            if (currentReaderDirection == ReaderDirection.topToBottom) {
              renderSize = Size(
                constraints.maxWidth,
                constraints.maxWidth *
                    _trueSizes[index]!.height /
                    _trueSizes[index]!.width,
              );
            } else {
              var maxHeight = constraints.maxHeight -
                  super._appBarHeight() -
                  (super._fullScreen
                      ? super._appBarHeight()
                      : super._bottomBarHeight());
              renderSize = Size(
                maxHeight *
                    _trueSizes[index]!.width /
                    _trueSizes[index]!.height,
                maxHeight,
              );
            }
          } else {
            if (currentReaderDirection == ReaderDirection.topToBottom) {
              renderSize = Size(constraints.maxWidth, constraints.maxWidth / 2);
            } else {
              // ReaderDirection.LEFT_TO_RIGHT
              // ReaderDirection.RIGHT_TO_LEFT
              renderSize =
                  Size(constraints.maxWidth / 2, constraints.maxHeight);
            }
          }
          var currentIndex = index;
          onTrueSize(Size size) {
            setState(() {
              _trueSizes[currentIndex] = size;
            });
          }

          _images.add(
            ComicImage(
              url: widget.pagesResult.pages[index].url,
              width: renderSize.width,
              height: renderSize.height,
              onTrueSize: onTrueSize,
            ),
          );
        }
        return zoomable.ZoomablePositionedList.builder(
          enableZoom: true,
          gestureSpeed: currentGestureSpeed,
          dragRegionLock: dragRegionLock,
          minScale: readerZoomMinScale,
          maxScale: readerZoomMaxScale,
          doubleTapScale: readerZoomDoubleTapScale,
          doubleTapAnimationDuration:
            noAnimation() ? Duration.zero : const Duration(milliseconds: 200),
          enableDoubleTapZoom:
            currentReaderControllerType != ReaderControllerType.touchDouble &&
              currentReaderControllerType !=
                ReaderControllerType.touchDoubleOnceNext,
          scrollOffsetController: _scrollOffsetController,
          scrollOffsetListener: _scrollOffsetListener,
          initialScrollIndex: widget.startIndex,
          scrollDirection: currentReaderDirection == ReaderDirection.topToBottom
              ? Axis.vertical
              : Axis.horizontal,
          reverse: currentReaderDirection == ReaderDirection.rightToLeft,
          padding: EdgeInsets.only(
            // 不管全屏与否, 滚动方向如何, 顶部永远保持间距
            top: super._appBarHeight(),
            bottom: currentReaderDirection == ReaderDirection.topToBottom
                ? 130 // 纵向滚动 底部永远都是130的空白
                : ( // 横向滚动
                    super._fullScreen
                        ? super._appBarHeight() // 全屏时底部和顶部到屏幕边框距离一样保持美观
                        : super._bottomBarHeight())
            // 非全屏时, 顶部去掉顶部BAR的高度, 底部去掉底部BAR的高度, 形成看似填充的效果
            ,
          ),
          itemScrollController: _itemScrollController,
          itemPositionsListener: _itemPositionsListener,
          itemCount: widget.pagesResult.pages.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (widget.pagesResult.pages.length == index) {
              return _buildNextEp();
            }
            return _images[index];
          },
        );
      },
    );
  }

  Widget _buildNextEp() {
    if (super._fullscreenController()) {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(20),
      child: MaterialButton(
        onPressed: super._onCloseAction,
        textColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(top: 40, bottom: 40),
          child: const Text('结束阅读'),
        ),
      ),
    );
  }

}

class _ComicReaderTwoPageGalleryState extends _ComicReaderState {
  late PageController _pageController;
  late PhotoViewGallery _gallery;
  late final int _spreadCount;

  bool get _disableGalleryGestures =>
      currentReaderControllerType == ReaderControllerType.touchDouble ||
      currentReaderControllerType == ReaderControllerType.touchDoubleOnceNext;

  @override
  void initState() {
    _spreadCount = (widget.pagesResult.pages.length + 1) ~/ 2;
    _pageController = PageController(initialPage: widget.startIndex ~/ 2);
    _gallery = PhotoViewGallery.builder(
      scrollDirection: widget.readerDirection == ReaderDirection.topToBottom
          ? Axis.vertical
          : Axis.horizontal,
      reverse: widget.readerDirection == ReaderDirection.rightToLeft,
      backgroundDecoration: const BoxDecoration(color: Colors.black),
      pageController: _pageController,
      onPageChanged: _onGalleryPageChange,
      itemCount: _spreadCount,
      allowImplicitScrolling: true,
      builder: (BuildContext context, int spreadIndex) {
        final leftIndex = spreadIndex * 2;
        final rightIndex = leftIndex + 1;

        Widget left = _buildPageImage(leftIndex);
        Widget right = rightIndex < widget.pagesResult.pages.length
            ? _buildPageImage(rightIndex)
            : const SizedBox.shrink();

        if (currentTwoPageDirection == TwoPageDirection.rightToLeft) {
          final tmp = left;
          left = right;
          right = tmp;
        }

        late Alignment leftAlignment, rightAlignment;
        switch (currentReaderTwoPageDirection) {
          case ReaderTwoPageDirection.closeTo:
            leftAlignment = Alignment.centerRight;
            rightAlignment = Alignment.centerLeft;
            break;
          case ReaderTwoPageDirection.pullAway:
            leftAlignment = Alignment.centerLeft;
            rightAlignment = Alignment.centerRight;
            break;
          case ReaderTwoPageDirection.eachCentered:
            leftAlignment = Alignment.center;
            rightAlignment = Alignment.center;
            break;
        }

        return PhotoViewGalleryPageOptions.customChild(
          disableGestures: _disableGalleryGestures,
          filterQuality: FilterQuality.high,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final w = constraints.hasBoundedWidth
                  ? constraints.maxWidth
                  : MediaQuery.of(context).size.width;
              final h = constraints.hasBoundedHeight
                  ? constraints.maxHeight
                  : MediaQuery.of(context).size.height;
              return SizedBox(
                width: w,
                height: h,
                child: Row(
                  children: [
                    SizedBox(
                      width: w / 2,
                      height: h,
                      child: Align(
                        alignment: leftAlignment,
                        child: left,
                      ),
                    ),
                    SizedBox(
                      width: w / 2,
                      height: h,
                      child: Align(
                        alignment: rightAlignment,
                        child: right,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
    super.initState();
  }

  Widget _buildPageImage(int index) {
    if (index < 0 || index >= widget.pagesResult.pages.length) {
      return const SizedBox.shrink();
    }
    return Image(
      image: ComicImageProvider(url: widget.pagesResult.pages[index].url),
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      errorBuilder: (b, e, s) {
        print("$e,$s");
        return const Center(
          child: Icon(Icons.broken_image_outlined, color: Colors.white70),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget _buildViewer() {
    return Column(
      children: [
        Container(height: _fullScreen ? 0 : super._appBarHeight()),
        Expanded(
          child: Stack(
            children: [
              _gallery,
              _buildNextEpController(),
            ],
          ),
        ),
        Container(height: _fullScreen ? 0 : super._bottomBarHeight()),
      ],
    );
  }

  @override
  _needJumpTo(int pageIndex, bool animation) {
    final target = pageIndex ~/ 2;
    if (!noAnimation() && animation) {
      _pageController.animateToPage(
        target,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    } else {
      _pageController.jumpToPage(target);
    }
  }

  void _onGalleryPageChange(int spreadIndex) {
    super._onCurrentChange(spreadIndex * 2);
  }

  Widget _buildNextEpController() {
    if (super._fullscreenController()) {
      return Container();
    }
    if (_current < widget.pagesResult.pages.length - 2) return Container();
    return Align(
      alignment: Alignment.bottomRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Color(0x88000000),
          ),
          child: GestureDetector(
            onTap: super._onCloseAction,
            child: const Text(
              '结束阅读',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
