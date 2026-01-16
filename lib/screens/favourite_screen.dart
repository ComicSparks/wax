import 'package:flutter/material.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/basic/methods.dart';

import '../protos/properties.pb.dart';
import 'components/actions.dart';
import 'components/browser_bottom_sheet.dart';
import 'components/comic_pager.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final List<FavoritesPartitionDto> _partitions = [];
  int _partitionId = 0;
  Key _pagerKey = UniqueKey();

  @override
  void initState() {
    _refreshPartitions();
    super.initState();
  }

  String get _currentPartitionName {
    if (_partitionId == 0) {
      return "全部";
    }
    for (final p in _partitions) {
      if (p.id.toInt() == _partitionId) {
        return p.name;
      }
    }
    return "全部";
  }

  Future<void> _refreshPartitions() async {
    try {
      final res = await methods.favoritesPartitions();
      _partitions
        ..clear()
        ..addAll(res.partitionList);
      if (_partitionId != 0 &&
          !_partitions.any((e) => e.id.toInt() == _partitionId)) {
        _partitionId = 0;
        _pagerKey = UniqueKey();
      }
      setState(() {});
    } catch (e) {
      // 不打断收藏列表展示（仍可用“全部”）
      print("$e");
    }
  }

  Future<void> _choosePartition() async {
    if (_partitions.isEmpty) {
      await _refreshPartitions();
    }
    final items = <Entity<int>>[
      Entity("全部", 0),
      ..._partitions.map((e) => Entity(e.name, e.id.toInt())),
    ];
    final chosen = await chooseEntity<int>(
      context,
      "选择收藏夹",
      items,
    );
    if (chosen == null) {
      return;
    }
    if (_partitionId != chosen.value) {
      setState(() {
        _partitionId = chosen.value;
        _pagerKey = UniqueKey();
      });
    }
  }

  Future<void> _openPartitionManager() async {
    final selectedId = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _FavoritesPartitionManageSheet(
        currentPartitionId: _partitionId,
      ),
    );
    await _refreshPartitions();
    if (selectedId != null && selectedId != _partitionId) {
      setState(() {
        _partitionId = selectedId;
        _pagerKey = UniqueKey();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: _choosePartition,
          child: Row(
            children: [
              const Text("收藏"),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _currentPartitionName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        actions: [
          ...alwaysInActions(),
          IconButton(
            onPressed: _openPartitionManager,
            icon: const Icon(Icons.folder_open),
            tooltip: "收藏夹管理",
          ),
          const BrowserBottomSheetAction(),
        ],
      ),
      body: ComicPager(
        key: _pagerKey,
        onPage: _fetch,
      ),
    );
  }

  Future<FetchComicResult> _fetch(int page) async {
    return methods.favoriteList(_partitionId, page);
  }
}

class _FavoritesPartitionManageSheet extends StatefulWidget {
  final int currentPartitionId;

  const _FavoritesPartitionManageSheet({
    required this.currentPartitionId,
  });

  @override
  State<_FavoritesPartitionManageSheet> createState() =>
      _FavoritesPartitionManageSheetState();
}

class _FavoritesPartitionManageSheetState
    extends State<_FavoritesPartitionManageSheet> {
  bool _loading = true;
  List<FavoritesPartitionDto> _partitions = [];

  @override
  void initState() {
    _load();
    super.initState();
  }

  Future<void> _load() async {
    try {
      setState(() {
        _loading = true;
      });
      final res = await methods.favoritesPartitions();
      setState(() {
        _partitions = res.partitionList;
        _loading = false;
      });
    } catch (e) {
      print("$e");
      if (mounted) {
        defaultToast(context, "加载收藏夹失败: $e");
      }
      setState(() {
        _loading = false;
      });
    }
  }

  Future<void> _create() async {
    final name = await displayTextInputDialog(
      context,
      title: "新建收藏夹",
      hint: "输入收藏夹名称",
    );
    if (name == null || name.trim().isEmpty) {
      return;
    }
    try {
      await methods.createFavoritesPartition(name.trim());
      await _load();
      defaultToast(context, "创建成功");
    } catch (e) {
      defaultToast(context, "创建失败: $e");
    }
  }

  Future<void> _rename(FavoritesPartitionDto dto) async {
    final name = await displayTextInputDialog(
      context,
      title: "重命名收藏夹",
      src: dto.name,
      hint: "输入新名称",
    );
    if (name == null || name.trim().isEmpty || name.trim() == dto.name) {
      return;
    }
    try {
      await methods.renameFavoritesPartition(dto.id.toInt(), name.trim());
      await _load();
      defaultToast(context, "修改成功");
    } catch (e) {
      defaultToast(context, "修改失败: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    return SafeArea(
      child: SizedBox(
        height: height,
        child: Column(
          children: [
            ListTile(
              title: const Text("收藏夹管理"),
              trailing: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Divider(height: 1),
            if (_loading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text("新建收藏夹"),
                      onTap: _create,
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.all_inbox),
                      title: const Text("全部"),
                      selected: widget.currentPartitionId == 0,
                      onTap: () => Navigator.of(context).pop(0),
                    ),
                    ..._partitions.map(
                      (p) => ListTile(
                        leading: const Icon(Icons.folder),
                        title: Text(p.name),
                        subtitle: Text("ID: ${p.id}"),
                        selected: widget.currentPartitionId == p.id.toInt(),
                        onTap: () => Navigator.of(context).pop(p.id.toInt()),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit),
                          tooltip: "重命名",
                          onPressed: () => _rename(p),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
