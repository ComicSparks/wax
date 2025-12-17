import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/screens/components/content_loading.dart';

import '../configs/is_pro.dart';

class AccessKeyReplaceScreen extends StatefulWidget {
  final String accessKey;

  const AccessKeyReplaceScreen({Key? key, required this.accessKey})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccessKeyReplaceScreenState();
}

class _AccessKeyReplaceScreenState extends State<AccessKeyReplaceScreen> {
  var _loading = false;
  var _message = "";
  var _success = false;

  _set() async {
    setState(() {
      _loading = true;
    });
    try {
      await methods.setPatAccessKey(widget.accessKey);
      await reloadIsPro();
      _success = true;
    } catch (e) {
      _message = "错误 : $e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _content() {
    if (_loading) {
      return const ContentLoading(label: '加载中');
    }
    if (_success) {
      return const Text('成功');
    }
    return Column(
      children: [
        Expanded(child: Container()),
        Text(widget.accessKey),
        Text(_message),
        Container(
          height: 10,
        ),
        MaterialButton(
          color: Colors.grey,
          onPressed: _set,
          child: const Text("确认"),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置 Patreon 授权码"),
      ),
      body: Center(
        child: _content(),
      ),
    );
  }
}
