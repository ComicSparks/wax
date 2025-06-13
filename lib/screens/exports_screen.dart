import 'package:flutter/material.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/screens/components/content_builder.dart';
import '../protos/properties.pb.dart';
import 'components/download_info_card.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;

import 'exporting_screen.dart';

class ExportsScreen extends StatefulWidget {
  const ExportsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExportsScreenState();
}

class _ExportsScreenState extends State<ExportsScreen> {
  Future<ComicDownloadsRes> _future = methods.downloads();
  Key _key = UniqueKey();
  List<$fixnum.Int64> selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("导出"),
        actions: [
          IconButton(
            onPressed: () async {
              await methods.resetDownload();
              setState(() {
                selected = [];
                _future = methods.downloads();
                _key = UniqueKey();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              if (selected.isEmpty) {
                defaultToast(context, "请选择要导出的漫画");
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ExportingScreen(selected);
              }));
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ContentBuilder(
        key: _key,
        future: _future,
        onRefresh: () async {},
        successBuilder: (
          BuildContext context,
          AsyncSnapshot<ComicDownloadsRes> snapshot,
        ) {
          final downloads = snapshot.requireData.downloads;
          List<ComicDownloadDto> items = [];
          for (var value in downloads) {
            if (
                //value.status == 1 &&
                !value.deleting) {
              items.add(value);
            }
          }
          return ListView(children: [
            ...items.map(_downloadCard),
          ]);
        },
      ),
    );
  }

  Widget _downloadCard(ComicDownloadDto e) {
    return InkWell(
      onTap: () {
        if (selected.contains(e.id)) {
          selected.remove(e.id);
        } else {
          selected.add(e.id);
        }
        setState(() {});
      },
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                selected.contains(e.id)
                    ? Icons.check_box
                    : Icons.square_outlined,
                color: Colors.blue,
              ),
            ),
          ),
          DownloadInfoCard(e),
        ],
      ),
    );
  }
}
