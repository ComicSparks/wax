import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart' as sb;
import 'package:wax/basic/methods.dart';

import '../protos/properties.pb.dart';
import 'components/actions.dart';
import 'components/browser_bottom_sheet.dart';
import 'components/comic_pager.dart';

class SearchScreen extends StatefulWidget {
  final String keyword;

  const SearchScreen({required this.keyword, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _textEditController =
  TextEditingController(text: widget.keyword);
  late final sb.SearchBar _searchBar = sb.SearchBar(
    hintText: '搜索',
    controller: _textEditController,
    inBar: false,
    setState: setState,
    onSubmitted: (value) {
      if (value.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SearchScreen(
                  keyword: value,
                ),
          ),
        );
      }
    },
    buildDefaultAppBar: (BuildContext context) {
      return AppBar(
        title: Text(widget.keyword),
        actions: [
          ...alwaysInActions(),
          _searchBar.getSearchAction(context),
          const BrowserBottomSheetAction(),
        ],
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchBar.build(context),
      body: ComicPager(
        onPage: _fetch,
        showViewedMark: true,
      ),
    );
  }

  Future<FetchComicResult> _fetch(int page) async {
    return methods.searchComic(widget.keyword, page);
  }
}
