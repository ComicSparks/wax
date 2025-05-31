import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wax/basic/methods.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import '../basic/commons.dart';
import '../configs/android_version.dart';

class ExportingScreen extends StatefulWidget {
  final List<$fixnum.Int64> selected;

  const ExportingScreen(this.selected, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExportingScreenState();
}

class _ExportingScreenState extends State<ExportingScreen> {
  int _exportStatus = 0; // 0: 未开始, 1: 正在导出, 2: 导出完成, 3: 导出失败
  String _exportMessage = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_exportStatus == 1) {
          defaultToast(context, "正在导出, 请稍后");
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("导出"),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    switch (_exportStatus) {
      case 0:
        return _buildStart();
      case 1:
        return _buildExporting();
      case 2:
        return _buildFinish();
      case 3:
        return _buildError();
      default:
        return Container();
    }
  }

  Widget _buildStart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("您一共选择了 ${widget.selected.length} 个漫画"),
          const SizedBox(height: 20),
          exportToZipButton(),
          exportToCbzButton(),
          exportToPdfButton(),
        ],
      ),
    );
  }

  Widget _buildExporting() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("导出中..."),
          SizedBox(height: 20),
          CupertinoActivityIndicator(),
        ],
      ),
    );
  }

  Widget _buildFinish() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("导出完成"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("返回"),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("导出失败"),
          Text(_exportMessage),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("返回"),
          ),
        ],
      ),
    );
  }

  Widget exportToZipButton() {
    return ElevatedButton(
      onPressed: () async {
        _export(1);
      },
      child: const Text("导出到*.jpegs.zip"),
    );
  }

  Widget exportToCbzButton() {
    return ElevatedButton(
      onPressed: () async {
        _export(2);
      },
      child: const Text("导出到*.cbz"),
    );
  }

  Widget exportToPdfButton() {
    return ElevatedButton(
      onPressed: () async {
        _export(3);
      },
      child: const Text("导出到*.pdf"),
    );
  }

  void _export(int type) async {
    String? folder = await chooseFolder();
    if (folder == null) {
      return;
    }
    setState(() {
      _exportStatus = 1;
    });
    try {
      await methods.exportToDir(folder, widget.selected, type);
      setState(() {
        _exportStatus = 2;
      });
    } catch (e) {
      setState(() {
        _exportStatus = 3;
        _exportMessage = e.toString();
      });
    }
  }

  Future<String?> chooseFolder() async {
    if (Platform.isIOS) {
      if (await confirmDialog(
        context,
        "您确认导出吗",
        "将会导出到您iOS设备的\"文件\"应用中, 曾经导出过的同名文件会覆盖",
      )) {
        return methods.iosGetDocumentDir();
      }
      return null;
    }
    if (Platform.isAndroid) {
      late bool g;
      if (androidVersion < 30) {
        g = await Permission.storage.request().isGranted;
      } else {
        g = await Permission.manageExternalStorage.request().isGranted;
      }
      if (!g) {
        defaultToast(context, "申请权限被拒绝");
        return null;
      }
    }
    return FilePicker.platform
        .getDirectoryPath(dialogTitle: "选择一个文件夹, 将文件保存到这里");
  }
}
