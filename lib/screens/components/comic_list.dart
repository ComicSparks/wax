import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/protos/properties.pb.dart';
import 'package:wax/screens/components/images.dart';
import '../../basic/commons.dart';
import '../../configs/pager_column_number.dart';
import '../../configs/pager_view_mode.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import '../comic_info_screen.dart';
import 'comic_info_card.dart';

class PagerMenu {
  final String name;
  final FutureOr Function(ComicSimple item) callback;

  PagerMenu({required this.name, required this.callback});
}

const List<PagerMenu> defaultPagerMenus = [];

class ComicList extends StatefulWidget {
  final bool inScroll;
  final List<ComicSimple> data;
  final List<ComicSimple>? selected;
  final Widget? append;
  final ScrollController? controller;
  final Function? onScroll;
  final List<PagerMenu> menus;

  const ComicList({
    Key? key,
    required this.data,
    this.selected,
    this.append,
    this.controller,
    this.inScroll = false,
    this.onScroll,
    this.menus = defaultPagerMenus,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicListState();
}

class _ComicListState extends State<ComicList> {
  @override
  void initState() {
    currentPagerViewModeEvent.subscribe(_setState);
    pageColumnEvent.subscribe(_setState);
    super.initState();
  }

  @override
  void dispose() {
    currentPagerViewModeEvent.unsubscribe(_setState);
    pageColumnEvent.unsubscribe(_setState);
    super.dispose();
  }

  _setState(_) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPagerViewMode) {
      case PagerViewMode.cover:
        return _buildCoverMode();
      case PagerViewMode.info:
        return _buildInfoMode();
      case PagerViewMode.titleInCover:
        return _buildTitleInCoverMode();
      case PagerViewMode.titleAndCover:
        return _buildTitleAndCoverMode();
    }
  }

  Widget _buildCoverMode() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.data.length; i++) {
      final card = Card(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ComicImage(
              url: widget.data[i].cover,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              addLongPressMenus: widget.selected == null
                  ? _buildDeleteMenu(widget.data[i])
                  : null,
              ignoreFormat: true,
            );
          },
        ),
      );
      GestureTapCallback callback = widget.selected == null
          ? () {
              _pushToComicInfo(widget.data[i]);
            }
          : () {
              if (widget.selected!.contains(widget.data[i])) {
                widget.selected!.remove(widget.data[i]);
              } else {
                widget.selected!.add(widget.data[i]);
              }
              setState(() {});
            };
      widgets.add(GestureDetector(
        onTap: callback,
        child: Stack(children: [
          card,
          ...widget.selected == null
              ? []
              : [
                  Row(children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        widget.selected!.contains(widget.data[i])
                            ? Icons.check_circle_sharp
                            : Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ]),
                ],
        ]),
      ));
    }
    if (widget.append != null) {
      widgets.add(widget.append!);
    }
    const double childAspectRatio = coverWidth / coverHeight;
    if (widget.inScroll) {
      var columnWidth = MediaQuery.of(context).size.width / pagerColumnNumber;
      var wrap = Wrap(
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: widgets
            .map((e) => SizedBox(
                  width: columnWidth,
                  height: columnWidth / childAspectRatio,
                  child: e,
                ))
            .toList(),
      );
      return wrap;
    }
    final view = GridView.count(
      childAspectRatio: childAspectRatio,
      crossAxisCount: pagerColumnNumber,
      controller: widget.controller,
      physics: const AlwaysScrollableScrollPhysics(),
      children: widgets,
    );
    return NotificationListener(
      child: view,
      onNotification: (scrollNotification) {
        widget.onScroll?.call();
        return true;
      },
    );
  }

  Widget _buildInfoMode() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.data.length; i++) {
      GestureTapCallback callback = widget.selected == null
          ? () {
              _pushToComicInfo(widget.data[i]);
            }
          : () {
              if (widget.selected!.contains(widget.data[i])) {
                widget.selected!.remove(widget.data[i]);
              } else {
                widget.selected!.add(widget.data[i]);
              }
              setState(() {});
            };
      widgets.add(GestureDetector(
        onLongPress:
            widget.selected == null ? _buildDeleteDialog(widget.data[i]) : null,
        onTap: callback,
        child: Stack(children: [
          ComicInfoCard(widget.data[i]),
          ...widget.selected == null
              ? []
              : [
                  Row(children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        widget.selected!.contains(widget.data[i])
                            ? Icons.check_circle_sharp
                            : Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ]),
                ],
        ]),
      ));
    }
    if (widget.append != null) {
      widgets.add(SizedBox(height: 100, child: widget.append!));
    }
    if (widget.inScroll) {
      return Column(children: widgets);
    }
    final view = ListView(
      controller: widget.controller,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      children: widgets,
    );
    return NotificationListener(
      child: view,
      onNotification: (scrollNotification) {
        widget.onScroll?.call();
        return true;
      },
    );
  }

  Widget _buildTitleInCoverMode() {
    List<Widget> widgets = [];
    for (var i = 0; i < widget.data.length; i++) {
      GestureTapCallback callback = widget.selected == null
          ? () {
              _pushToComicInfo(widget.data[i]);
            }
          : () {
              if (widget.selected!.contains(widget.data[i])) {
                widget.selected!.remove(widget.data[i]);
              } else {
                widget.selected!.add(widget.data[i]);
              }
              setState(() {});
            };
      widgets.add(GestureDetector(
        onLongPress:
            widget.selected == null ? _buildDeleteDialog(widget.data[i]) : null,
        onTap: callback,
        child: Stack(children: [
          Card(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final Widget image = ComicImage(
                  url: widget.data[i].cover,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  addLongPressMenus: _buildDeleteMenu(widget.data[i]),
                  ignoreFormat: true,
                );
                return Stack(
                  children: [
                    image,
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        color: Colors.black.withAlpha(180),
                        width: constraints.maxWidth,
                        child: Text(
                          "${widget.data[i].title}\n",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            height: 1.3,
                          ),
                          strutStyle: const StrutStyle(
                            height: 1.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          ...widget.selected == null
              ? []
              : [
                  Row(children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        widget.selected!.contains(widget.data[i])
                            ? Icons.check_circle_sharp
                            : Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ]),
                ],
        ]),
      ));
    }
    if (widget.append != null) {
      widgets.add(widget.append!);
    }
    const double childAspectRatio = coverWidth / coverHeight;
    if (widget.inScroll) {
      var columnWidth = MediaQuery.of(context).size.width / pagerColumnNumber;
      var wrap = Wrap(
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.spaceBetween,
        children: widgets
            .map((e) => SizedBox(
                  width: columnWidth,
                  height: columnWidth / childAspectRatio,
                  child: e,
                ))
            .toList(),
      );
      return wrap;
    }
    final view = GridView.count(
      childAspectRatio: childAspectRatio,
      crossAxisCount: pagerColumnNumber,
      controller: widget.controller,
      physics: const AlwaysScrollableScrollPhysics(),
      children: widgets,
    );
    return NotificationListener(
      child: view,
      onNotification: (scrollNotification) {
        widget.onScroll?.call();
        return true;
      },
    );
  }

  Widget _buildTitleAndCoverMode() {
    final mq = MediaQuery.of(context);
    final width = (mq.size.width - 20) / pagerColumnNumber;
    final double height = width * coverHeight / coverWidth;
    List<Widget> widgets = [];
    for (var i = 0; i < widget.data.length; i++) {
      GestureTapCallback callback = widget.selected == null
          ? () {
              _pushToComicInfo(widget.data[i]);
            }
          : () {
              if (widget.selected!.contains(widget.data[i])) {
                widget.selected!.remove(widget.data[i]);
              } else {
                widget.selected!.add(widget.data[i]);
              }
              setState(() {});
            };
      widgets.add(GestureDetector(
        onLongPress:
            widget.selected == null ? _buildDeleteDialog(widget.data[i]) : null,
        onTap: callback,
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: Card(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      late final Widget image = ComicImage(
                        url: widget.data[i].cover,
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        addLongPressMenus: _buildDeleteMenu(widget.data[i]),
                        ignoreFormat: true,
                      );
                      return image;
                    },
                  ),
                ),
              ),
              Container(
                width: width,
                height: 50,
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Text(
                  "${widget.data[i].title}\n",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    height: 1.3,
                  ),
                  strutStyle: const StrutStyle(
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          ...widget.selected == null
              ? []
              : [
                  Row(children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Icon(
                        widget.selected!.contains(widget.data[i])
                            ? Icons.check_circle_sharp
                            : Icons.circle_outlined,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ]),
                ],
        ]),
      ));
    }
    if (widget.append != null) {
      widgets.add(widget.append!);
    }
    final wrap = Wrap(
      alignment: WrapAlignment.spaceAround,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.spaceBetween,
      children: widgets,
    );
    if (widget.inScroll) {
      return wrap;
    }
    final view = ListView(
      controller: widget.controller,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      children: [wrap],
    );
    return NotificationListener(
      child: view,
      onNotification: (scrollNotification) {
        widget.onScroll?.call();
        return true;
      },
    );
  }

  void _pushToComicInfo(ComicSimple data) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ComicInfoScreen(data);
    }));
  }

  GestureLongPressCallback? _buildDeleteDialog(ComicSimple cb) {
    var menus = List<PagerMenu>.from(widget.menus);
    if (cb.favouriteId > 0) {
      menus.add(PagerMenu(
        name: "删除收藏",
        callback: (data) async {
          try {
            await methods.deleteFavourite(data.favouriteId);
            data.favouriteId = $fixnum.Int64.fromInts(0, 0);
            defaultToast(context, "删除成功, 刷新页面之后会消失");
          } catch (e) {
            defaultToast(context, "删除失败: $e");
          }
        },
      ));
    }
    if (menus.isNotEmpty) {
      return () async {
        final choose = await chooseListDialog(
          context,
          title: "操作 ${cb.title}",
          values: [
            ...menus.map((e) => e.name),
            "取消",
          ],
        );
        if (choose != null) {
          for (var menu in menus) {
            if (menu.name == choose) {
              await menu.callback(cb);
            }
          }
        }
      };
    }
    return null;
  }

  List<TextMenu>? _buildDeleteMenu(ComicSimple data) {
    List<TextMenu> menus = widget.menus
        .map((e) => TextMenu(e.name, () => e.callback(data)))
        .toList();
    if (data.favouriteId > 0) {
      menus.add(TextMenu("删除收藏", deleteAction(data)));
    }
    if (menus.isNotEmpty) {
      return menus;
    }
    return null;
  }

  void Function() deleteAction(ComicSimple data) {
    return () {
      () async {
        try {
          await methods.deleteFavourite(data.favouriteId);
          data.favouriteId = $fixnum.Int64.fromInts(0, 0);
          defaultToast(context, "删除成功, 刷新页面之后会消失");
        } catch (e) {
          defaultToast(context, "删除失败: $e");
        }
      }();
    };
  }
}
