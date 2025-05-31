import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/protos/properties.pb.dart';

import '../basic/commons.dart';
import 'browser_screen.dart';
import 'comic_reader_screen.dart';
import 'components/actions.dart';
import 'components/content_builder.dart';
import 'components/images.dart';

class ComicInfoScreen extends StatefulWidget {
  final ComicSimple comicSimple;

  const ComicInfoScreen(this.comicSimple, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ComicInfoScreenState();
}

class _ComicInfoScreenState extends State<ComicInfoScreen> with RouteAware {
  late Future<ComicInfoResult> _future;
  late Future<int> _postionFuture;
  late Future<bool> _hasDownloadFuture;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Future.delayed(Duration.zero, () async {
      setState(() {
        _postionFuture = methods.loadViewLog(widget.comicSimple.id);
      });
    });
  }

  Future<ComicInfoResult> _loadComic() async {
    var info = await methods.comicInfo(widget.comicSimple.id);
    var _ = methods.saveViewInfo(widget.comicSimple); // 在后台线程保存浏览记录
    return info;
  }

  @override
  void initState() {
    _future = _loadComic();
    _postionFuture = methods.loadViewLog(widget.comicSimple.id);
    _hasDownloadFuture = methods.hasDownload(widget.comicSimple.id);
    super.initState();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comicSimple.title),
        actions: [
          FutureBuilder(
            future: _future,
            builder: (BuildContext context,
                AsyncSnapshot<ComicInfoResult> snapshot1) {
              if (snapshot1.hasError ||
                  snapshot1.connectionState != ConnectionState.done) {
                return Container();
              }
              return FutureBuilder(
                future: _hasDownloadFuture,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot2) {
                  if (snapshot2.hasError ||
                      snapshot2.connectionState != ConnectionState.done) {
                    return Container();
                  }
                  if (snapshot2.requireData) {
                    // todo downloading
                    return IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.download_done),
                    );
                  } else {
                    return IconButton(
                      onPressed: () async {
                        var confirm =
                            await confirmDialog(context, "下载", "下载这个漫画吗？");
                        if (confirm) {
                          await methods.pushToDownloads([
                            widget.comicSimple,
                          ]);
                          setState(() {
                            _hasDownloadFuture =
                                methods.hasDownload(widget.comicSimple.id);
                          });
                          defaultToast(context, "已加入下载队列");
                        }
                      },
                      icon: const Icon(Icons.download),
                    );
                  }
                },
              );
            },
          ),
          ...alwaysInActions(),
        ],
      ),
      body: Stack(
        children: [
          _body(),
          _readContinueButton(),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  bottom: 30,
                ),
                child: _readButton(),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  bottom: 30,
                ),
                child: _favouriteButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return ContentBuilder(
      future: _future,
      onRefresh: () async {
        setState(() {
          _future = _loadComic();
          _postionFuture = methods.loadViewLog(widget.comicSimple.id);
        });
      },
      successBuilder:
          (BuildContext context, AsyncSnapshot<ComicInfoResult> snapshot) {
        var item = snapshot.data!;
        var mq = MediaQuery.of(context);
        var imageWidth =
            (mq.size.width < mq.size.height) ? mq.size.width : mq.size.height;
        imageWidth = imageWidth / 2;
        var subColor = Color.alphaBlend(
          Colors.grey.shade500.withAlpha(80),
          (Theme.of(context).textTheme.bodyText1?.color ?? Colors.black),
        );
        return ListView(
          children: [
            Container(height: 20),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: imageWidth,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  child: HorizontalStretchComicImage(
                    url: widget.comicSimple.cover,
                    originSize: Size(
                      coverWidth.toDouble(),
                      coverHeight.toDouble(),
                    ),
                  ),
                ),
              ),
            ),
            Container(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: GestureDetector(
                onLongPress: () {
                  confirmCopy(context, widget.comicSimple.title);
                },
                child: Text(
                  widget.comicSimple.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(height: 10),
            Align(
              alignment: Alignment.center,
              child: Text.rich(TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  color: subColor,
                ),
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 12,
                      color: subColor,
                    ),
                  ),
                  const TextSpan(text: " "),
                  const TextSpan(text: "  "),
                ],
              )),
            ),
            Container(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Wrap(
                children: (item.comicInfo.labels.map(_buildLabel)).toList(),
              ),
            ),
            Container(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Wrap(
                children: (item.comicInfo.tags.map(_buildTag)).toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _readContinueButton() {
    return FutureBuilder(
      key: const Key("CONTINUE_READ_BUTTON"),
      future: _postionFuture,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          final position = snapshot.requireData;
          if (position > 0) {
            return SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 100,
                    bottom: 30,
                  ),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ComicReaderScreen(
                          comic: widget.comicSimple,
                          initRank: position,
                          loadResult: () {
                            return methods.comicPages(widget.comicSimple.id);
                          },
                        );
                      }));
                    },
                    child: const Icon(Icons.auto_stories),
                  ),
                ),
              ),
            );
          }
        }
        return Container();
      },
    );
  }

  Widget _readButton() {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<ComicInfoResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return FloatingActionButton(
            key: const Key("READ_BUTTON"),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ComicReaderScreen(
                  comic: widget.comicSimple,
                  loadResult: () {
                    return methods.comicPages(widget.comicSimple.id);
                  },
                );
              }));
            },
            child: const Icon(Icons.menu_book),
          );
        }
        return Container();
      },
    );
  }

  Widget _favouriteButton() {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<ComicInfoResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasError) {
          return FloatingActionButton(
            onPressed: () {
              () async {
                try {
                  // 获取所有收藏夹的名字
                  var result = await methods.favoritesPartitions();
                  // 找到默认分类
                  FavoritesPartitionDto? dto;
                  for (var value in result.partitionList) {
                    if (value.name == "默认分类") {
                      dto = value;
                      break;
                    }
                  }
                  // 如果没有则新建, 并且再次获取
                  if (dto == null) {
                    await methods.createFavoritesPartition("默认分类");
                  }
                  result = await methods.favoritesPartitions();
                  for (var value in result.partitionList) {
                    if (value.name == "默认分类") {
                      dto = value;
                      break;
                    }
                  }
                  final dtoFinal = dto!;
                  // 加入默认分类收藏夹
                  await methods.favoriteComic(
                    widget.comicSimple.id,
                    dtoFinal.id,
                  );
                  //
                  defaultToast(context, "收藏成功");
                } catch (e) {
                  print("$e");
                  defaultToast(context, "收藏失败");
                }
              }();
            },
            child: const Icon(Icons.favorite),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildLabel(String tag) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (BuildContext context) {
        //   return BrowserScreen(tag: tag);
        // }));
      },
      child: Card(
        elevation: 0,
        child: Text.rich(TextSpan(
          style: const TextStyle(fontSize: 10),
          children: [
            WidgetSpan(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                  color: Colors.grey.withAlpha(20),
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 4, right: 4),
                  child: Text(tag),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return BrowserScreen(tag: tag);
        }));
      },
      child: Card(
        child: Text.rich(TextSpan(
          style: const TextStyle(fontSize: 10),
          children: [
            WidgetSpan(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                  color: Colors.grey.withAlpha(20),
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 4, right: 4),
                  child: Text(tag),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
