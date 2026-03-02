import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/protos/properties.pb.dart';

import '../../configs/is_pro.dart';
import '../../configs/pager_controller_mode.dart';
import '../../configs/show_viewed_mark.dart';
import 'comic_list.dart';
import 'content_builder.dart';

class ComicPager extends StatefulWidget {
  final List<PagerMenu> menus;
  final Future<FetchComicResult> Function(int page) onPage;
  final bool showViewedMark;

  const ComicPager(
      {
      required this.onPage,
      this.menus = defaultPagerMenus,
      this.showViewedMark = false,
      Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicPagerState();
}

class _ComicPagerState extends State<ComicPager> {
  @override
  void initState() {
    currentPagerControllerModeEvent.subscribe(_setState);
    super.initState();
  }

  @override
  void dispose() {
    currentPagerControllerModeEvent.unsubscribe(_setState);
    super.dispose();
  }

  _setState(_) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    switch (currentPagerControllerMode) {
      case PagerControllerMode.stream:
        return _StreamPager(
          onPage: widget.onPage,
          menus: widget.menus,
          showViewedMark: widget.showViewedMark,
        );
      case PagerControllerMode.pager:
        return _PagerPager(
          onPage: widget.onPage,
          menus: widget.menus,
          showViewedMark: widget.showViewedMark,
        );
    }
  }
}

class _StreamPager extends StatefulWidget {
  final List<PagerMenu> menus;
  final Future<FetchComicResult> Function(int page) onPage;
  final bool showViewedMark;

  const _StreamPager({
    Key? key,
    required this.onPage,
    required this.menus,
    required this.showViewedMark,
  })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _StreamPagerState();
}

class _StreamPagerState extends State<_StreamPager> {
  int _maxPage = 1;
  int _nextPage = 1;

  var _joining = false;
  var _joinSuccess = true;

  bool get _notPro => !isPro && _nextPage > 20;

  Future _join() async {
    try {
      setState(() {
        _joining = true;
      });
      var response = await widget.onPage(_nextPage);
      await _loadViewedMarksFor(response.comics);
      _nextPage++;
      _data.addAll(response.comics);
      _maxPage = response.maxPage.toInt();
      setState(() {
        _joinSuccess = true;
        _joining = false;
      });
    } catch (e, st) {
      print("$e\n$st");
      setState(() {
        _joinSuccess = false;
        _joining = false;
      });
    }
  }

  final List<ComicSimple> _data = [];
  final Map<String, bool> _viewedMap = {};
  List<ComicSimple>? _selected = null;
  late ScrollController _controller;
  var _key = UniqueKey();

  bool get _enableViewedMark => widget.showViewedMark && showViewedMark;

  Future<void> _loadViewedMarksFor(List<ComicSimple> comics) async {
    if (!_enableViewedMark) {
      return;
    }
    final ids = comics
        .map((e) => e.id)
        .where((id) => !_viewedMap.containsKey(id.toString()))
        .toList();
    if (ids.isEmpty) {
      return;
    }
    try {
      final values = await methods.hasViewLogs(ids);
      if (!mounted) {
        return;
      }
      setState(() {
        _viewedMap.addAll(values);
      });
    } catch (_) {}
  }

  @override
  void initState() {
    _controller = ScrollController();
    _join();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_joining || _nextPage > _maxPage || _notPro) {
      return;
    }
    if (_controller.position.pixels + 100 >
        _controller.position.maxScrollExtent) {
      _join();
    }
  }

  Future _onJump() async {
    if (_joining) {
      defaultToast(context, "尚有页面数据正在加载中，请稍后");
    }
    // input page number
    var input =
        await displayTextInputDialog(context, src: _nextPage.toString());
    if (input == null || input.isEmpty) {
      return;
    }
    var num = int.tryParse(input);
    if (num == null || num <= 0 || num > _maxPage) {
      defaultToast(context, "请输入正确的页码");
      return;
    }
    _data.clear();
    _nextPage = num;
    _joining = false;
    _joinSuccess = true;
    _viewedMap.clear();
    _key = UniqueKey();
    setState(() {});
    _join();
  }

  Widget? _buildLoadingCard() {
    if (_notPro) {
      return Card(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const CupertinoActivityIndicator(
                radius: 14,
              ),
            ),
            const Text(
              '剩下的需要发电鸭',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    if (_joining) {
      return Card(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const CupertinoActivityIndicator(
                radius: 14,
              ),
            ),
            const Text('加载中'),
          ],
        ),
      );
    }
    if (!_joinSuccess) {
      return Card(
        child: InkWell(
          onTap: () {
            _join();
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Icon(Icons.sync_problem_rounded),
              ),
              const Text(' 出错, 点击重试'),
            ],
          ),
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPagerBar(),
        Expanded(
          child: ComicList(
            key: _key,
            controller: _controller,
            onScroll: _onScroll,
            data: _data,
            selected: _selected,
            showViewedMark: _enableViewedMark,
            viewedMap: _viewedMap,
            append: _buildLoadingCard(),
            menus: widget.menus,
          ),
        ),
      ],
    );
  }

  PreferredSize _buildPagerBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(30),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              style: BorderStyle.solid,
              color: Colors.grey[200]!,
            ),
          ),
        ),
        child: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _onJump();
                },
                child: Text("已加载 ${_nextPage - 1} / $_maxPage 页"),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  if (_selected == null) {
                    _selected = [];
                    setState(() {});
                  } else {
                    _selected = null;
                    setState(() {});
                  }
                },
                child: const Text("选择"),
              ),
              const Text(
                " / ",
                style: TextStyle(color: Colors.grey),
              ),
              GestureDetector(
                onTap: () async {
                  if (_selected != null) {
                    if (!isPro) {
                      defaultToast(context, "发电才能批量下载");
                      return;
                    }
                    await methods.pushToDownloads(_selected!);
                    defaultToast(context, "已经加入下载队列");
                    _selected = null;
                    setState(() {});
                  }
                },
                child: Text(
                  "下载",
                  style: TextStyle(
                    color: _selected == null ? Colors.grey : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PagerPager extends StatefulWidget {
  final List<PagerMenu> menus;
  final Future<FetchComicResult> Function(int page) onPage;
  final bool showViewedMark;

  const _PagerPager({
    Key? key,
    required this.onPage,
    required this.menus,
    required this.showViewedMark,
  })
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PagerPagerState();
}

class _PagerPagerState extends State<_PagerPager> {
  final TextEditingController _textEditController =
      TextEditingController(text: '');
  late int _currentPage = 1;
  late int _maxPage = 1;
  late final List<ComicSimple> _data = [];
  final Map<String, bool> _viewedMap = {};
  late Future _pageFuture = _load();
  List<ComicSimple>? _selected;

  bool get _enableViewedMark => widget.showViewedMark && showViewedMark;

  Future<void> _loadViewedMarksFor(List<ComicSimple> comics) async {
    if (!_enableViewedMark) {
      return;
    }
    final ids = comics.map((e) => e.id).toList();
    if (ids.isEmpty) {
      return;
    }
    try {
      final values = await methods.hasViewLogs(ids);
      if (!mounted) {
        return;
      }
      setState(() {
        _viewedMap
          ..clear()
          ..addAll(values);
      });
    } catch (_) {}
  }

  Future<dynamic> _load() async {
    _selected = null;
    var response = await widget.onPage(_currentPage);
    await _loadViewedMarksFor(response.comics);
    setState(() {
      _data.clear();
      _data.addAll(response.comics);
      _maxPage = response.maxPage.toInt();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContentBuilder(
      future: _pageFuture,
      onRefresh: () async {
        setState(() {
          _pageFuture = _load();
        });
      },
      successBuilder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: _buildPagerBar(),
          body: ComicList(
            data: _data,
            selected: _selected,
            showViewedMark: _enableViewedMark,
            viewedMap: _viewedMap,
            menus: widget.menus,
          ),
        );
      },
    );
  }

  PreferredSize _buildPagerBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              style: BorderStyle.solid,
              color: Colors.grey[200]!,
            ),
          ),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _textEditController.clear();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Card(
                          child: TextField(
                            controller: _textEditController,
                            decoration: const InputDecoration(
                              labelText: "请输入页数：",
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'\d+')),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('取消'),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                              var text = _textEditController.text;
                              if (text.isEmpty || text.length > 5) {
                                return;
                              }
                              var num = int.parse(text);
                              if (num == 0 || num > _maxPage) {
                                return;
                              }
                              if (num > 20 && !isPro) {
                                defaultToast(context, "下一页需要发电鸭");
                                return;
                              }
                              setState(() {
                                _currentPage = num;
                                _pageFuture = _load();
                              });
                            },
                            child: const Text('确定'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Text("第 $_currentPage / $_maxPage 页"),
                  ],
                ),
              ),
              Row(children: [
                GestureDetector(
                  onTap: () {
                    if (_selected == null) {
                      _selected = [];
                      setState(() {});
                    } else {
                      _selected = null;
                      setState(() {});
                    }
                  },
                  child: const Text("选择"),
                ),
                const Text(
                  " / ",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_selected != null) {
                      if (!isPro) {
                        defaultToast(context, "发电才能批量下载");
                        return;
                      }
                      await methods.pushToDownloads(_selected!);
                      defaultToast(context, "已经加入下载队列");
                      _selected = null;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "下载",
                    style: TextStyle(
                      color: _selected == null ? Colors.grey : null,
                    ),
                  ),
                ),
              ]),
              Row(
                children: [
                  MaterialButton(
                    minWidth: 0,
                    onPressed: () {
                      if (_currentPage > 1) {
                        setState(() {
                          _currentPage = _currentPage - 1;
                          _pageFuture = _load();
                        });
                      }
                    },
                    child: const Text('上一页'),
                  ),
                  MaterialButton(
                    minWidth: 0,
                    onPressed: () {
                      if (_currentPage < _maxPage) {
                        var num = _currentPage + 1;
                        if (num > 20 && !isPro) {
                          defaultToast(context, "下一页需要发电鸭");
                          return;
                        }
                        setState(() {
                          _currentPage = num;
                          _pageFuture = _load();
                        });
                      }
                    },
                    child: const Text('下一页'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
