import 'package:flutter/material.dart';

import '../basic/methods.dart';
import '../protos/properties.pb.dart';
import 'components/comic_pager.dart';

class RankScreen extends StatefulWidget {
  const RankScreen({Key? key}) : super(key: key);

  @override
  State<RankScreen> createState() => _RankScreenState();
}

class _RankScreenState extends State<RankScreen> with TickerProviderStateMixin {
  int _idx = 0;
  late final TabController _tabController =
      TabController(length: 3, vsync: this, initialIndex: _idx);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('排行'),
      ),
      body: Column(children: [
        TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).textTheme.bodyText1?.color ?? Theme.of(context).colorScheme.onSurface,
          unselectedLabelColor: Theme.of(context).textTheme.bodyText2?.color ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
          tabs: const [
            Tab(text: '日榜'),
            Tab(text: '周榜'),
            Tab(text: '月榜'),
          ],
          onTap: (index) {
            setState(() {
              _idx = index;
            });
          },
        ),
        Expanded(
          child: ComicPager(
            key: Key("rank:$_idx"),
            onPage: _onPage,
          ),
        ),
      ]),
    );
  }

  Future<FetchComicResult> _onPage(int page) {
    var rankType = "";
    switch (_idx) {
      case 0:
        rankType = "day";
        break;
      case 1:
        rankType = "week";
        break;
      case 2:
        rankType = "month";
        break;
    }
    return methods.rankComic(rankType, page);
  }
}
