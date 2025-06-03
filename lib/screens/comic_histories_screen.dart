import 'package:flutter/material.dart';
import 'package:wax/basic/commons.dart';

import '../basic/methods.dart';
import '../protos/properties.pb.dart';
import 'components/comic_pager.dart';

class ComicHistoriesScreen extends StatefulWidget {
  const ComicHistoriesScreen({Key? key}) : super(key: key);

  @override
  State<ComicHistoriesScreen> createState() => _ComicHistoriesScreenState();
}

class _ComicHistoriesScreenState extends State<ComicHistoriesScreen> {
  var key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("历史记录"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () async {
              var a = await confirmDialog(context, "清空所有历史记录", "确定吗?");
              if (a == true) {
                try {
                  await methods.clearHistory();
                  setState(() {
                    key = UniqueKey(); // Reset the pager
                  });
                } catch (e) {
                  print("清空历史记录失败: $e");
                }
              }
            },
          ),
        ],
      ),
      body: ComicPager(
        key: key,
        onPage: _onPage,
      ),
    );
  }

  Future<FetchComicResult> _onPage(int page) async {
    return await methods.fetchHistory(page);
  }
}
