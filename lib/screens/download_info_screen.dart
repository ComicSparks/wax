import 'package:flutter/material.dart';
import '../basic/commons.dart';
import '../basic/methods.dart';
import '../protos/properties.pb.dart';
import 'browser_screen.dart';
import 'comic_reader_screen.dart';
import 'components/content_builder.dart';
import 'components/images.dart';

class DownloadInfoScreen extends StatefulWidget {
  final ComicDownloadDto e;

  const DownloadInfoScreen(this.e, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DownloadInfoScreenState();
}

class _DownloadInfoScreenState extends State<DownloadInfoScreen>
    with RouteAware {
  late final Future<ComicDownloadInfoDto> _future =
      methods.downloadInfo(widget.e.id);

  int position = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Future.delayed(Duration.zero, () async {
      position = await methods.loadViewLog(widget.e.id);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    didPopNext();
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
        title: Text(widget.e.title),
      ),
      body: Stack(
        children: [
          ContentBuilder(
            future: _future,
            onRefresh: () async {
              setState(() {});
            },
            successBuilder: (BuildContext context,
                AsyncSnapshot<ComicDownloadInfoDto> snapshot) {
              var item = snapshot.data!;
              var mq = MediaQuery.of(context);
              var imageWidth = (mq.size.width < mq.size.height)
                  ? mq.size.width
                  : mq.size.height;
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
                    // todo, offline
                    child: SizedBox(
                      width: imageWidth,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        child: HorizontalStretchComicImage(
                          url: widget.e.cover,
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
                    child: Text(
                      widget.e.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
                      children: (item.tags.map(_buildTag)).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
          FutureBuilder(
            future: _future,
            builder: (BuildContext context,
                AsyncSnapshot<ComicDownloadInfoDto> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.hasError) {
                return SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, bottom: 30),
                      child: FloatingActionButton(
                        key: const Key("READ_BUTTON"),
                        heroTag: "download_info_read",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ComicReaderScreen(
                              comic: ComicSimple(
                                id: widget.e.id,
                                cover: widget.e.cover,
                                title: widget.e.title,
                              ),
                              loadResult: () async {
                                var pages =
                                    (await methods.downloadPages(widget.e.id))
                                        .pages;
                                var pagesRsp = ComicPagesResult(
                                  pages: pages.map((e) => ComicPage(
                                        caption: e.caption,
                                        url: e.url,
                                      )),
                                );
                                return pagesRsp;
                              },
                            );
                          }));
                        },
                        child: const Icon(Icons.menu_book),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
          if (position > 0)
            FutureBuilder(
              key: const Key("CONTINUE_READ_BUTTON"),
              future: _future,
              builder: (BuildContext context,
                  AsyncSnapshot<ComicDownloadInfoDto> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasError) {
                  return SafeArea(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100, bottom: 30),
                      child: FloatingActionButton(
                        heroTag: "download_info_continue_read",
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return ComicReaderScreen(
                              comic: ComicSimple(
                                id: widget.e.id,
                                cover: widget.e.cover,
                                title: widget.e.title,
                              ),
                              initRank: position,
                              loadResult: () async {
                                var pages =
                                    (await methods.downloadPages(widget.e.id))
                                        .pages;
                                var pagesRsp = ComicPagesResult(
                                  pages: pages.map((e) => ComicPage(
                                        caption: e.caption,
                                        url: e.url,
                                      )),
                                );
                                return pagesRsp;
                              },
                            );
                          }));
                        },
                        child: const Icon(Icons.auto_stories),
                      ),
                    ),
                  ));
                }
                return Container();
              },
            ),
        ],
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
