import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart' as sb;
import 'package:wax/basic/methods.dart';
import 'package:wax/configs/host.dart';
import 'package:wax/protos/properties.pb.dart';
import 'package:wax/screens/comic_histories_screen.dart';
import 'package:wax/screens/downloads_screen.dart';
import 'package:wax/screens/favourite_screen.dart';
import 'package:wax/screens/pro_screen.dart';
import 'package:wax/screens/rank_screen.dart';
import 'package:wax/screens/search_screen.dart';

import '../basic/cates.dart';
import '../configs/is_pro.dart';
import '../configs/versions.dart';
import 'components/actions.dart';
import 'components/browser_bottom_sheet.dart';
import 'components/comic_pager.dart';

class BrowserScreen extends StatefulWidget {
  final String tag;

  const BrowserScreen({this.tag = "", Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    hostEvent.subscribe(_setState);
    proEvent.subscribe(_setState);
    Future.delayed(Duration.zero, () async {
      versionPop(context);
      versionEvent.subscribe(_versionSub);
    });
    super.initState();
  }

  @override
  void dispose() {
    hostEvent.unsubscribe(_setState);
    proEvent.unsubscribe(_setState);
    super.dispose();
  }

  _setState(_) {
    setState(() {});
  }

  _versionSub(_) {
    versionPop(context);
  }

  late final sb.SearchBar _searchBar = sb.SearchBar(
    hintText: '搜索',
    inBar: false,
    setState: setState,
    onSubmitted: (value) {
      if (value.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchScreen(keyword: value),
          ),
        );
      }
    },
    buildDefaultAppBar: (BuildContext context) {
      return AppBar(
        title: Text(_title()),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.document_scanner,
            ),
            onSelected: (value) {
              switch (value) {
                case 'history':
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const ComicHistoriesScreen();
                  }));
                  break;
                case 'download':
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const DownloadsScreen();
                  }));
                  break;
                case 'fav':
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return const FavouriteScreen();
                  }));
                  break;
                case 'rank':
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return RankScreen();
                  }));
                  break;
              }
            },
            itemBuilder: (context) {
              final textColor = Theme.of(context).textTheme.bodyText1?.color ?? Theme.of(context).colorScheme.onSurface;
              return [
                PopupMenuItem(value: 'history', child: Row(children: [
                   Text(" "),
                   Icon(Icons.history, color: textColor),
                   Text(' 历 史 '),
                ],)),
                PopupMenuItem(value: 'download', child: Row(children: [
                   Text(" "),
                   Icon(Icons.download, color: textColor),
                   Text(' 下 载 '),
                ],)),
                PopupMenuItem(value: 'fav', child: Row(children: [
                   Text(" "),
                   Icon(Icons.favorite, color: textColor),
                   Text(' 收 藏 '),
                ],)),
                PopupMenuItem(value: 'rank', child: Row(children: [
                   Text(" "),
                   Icon(Icons.bar_chart_outlined, color: textColor),
                   Text(' 排 行 '),
                ],)),
              ];
            },
          ),
          ...alwaysInActions(),
          _searchBar.getSearchAction(context),
          chooseCateAction(context),
          const BrowserBottomSheetAction(),
        ],
      );
    },
  );

  late final _tag = widget.tag;
  var _cate = "";

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _searchBar.build(context),
      body: ComicPager(
        key: Key("$host:$_tag:$_cate"),
        onPage: _onPage,
      ),
    );
  }

  String _title() {
    if (_tag != "") {
      return _tag;
    }
    if (_cate != "") {
      return catesVnMap[_cate] ?? "";
    }
    return "全部漫画";
  }

  Future<FetchComicResult> _onPage(int page) async {
    if (_tag != "") {
      return methods.fetchComic(
        "tag",
        _tag,
        page,
      );
    }
    if (_cate != "") {
      return methods.fetchComic(
        "cate",
        _cate,
        page,
      );
    }
    return methods.fetchComic("", "", page);
  }

  Widget chooseCateAction(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final c = await chooseCate(context);
        if (c != null) {
          setState(() {
            _cate = c;
          });
        }
      },
      icon: const Icon(Icons.category),
    );
  }

}
