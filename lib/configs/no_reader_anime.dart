/// 音量键翻页

import 'dart:io';

import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

const _propertyName = "noReaderAnime";
late bool noReaderAnime;

Future<void> initNoReaderAnime() async {
  noReaderAnime = (await methods.loadProperty(k: _propertyName)) == "true";
}

Widget noReaderAnimeSetting() {
  return StatefulBuilder(builder:
      (BuildContext context, void Function(void Function()) setState) {
    return SwitchListTile(
        title: const Text("阅读器无翻页动画"),
        value: noReaderAnime,
        onChanged: (target) async {
          await methods.saveProperty(k: _propertyName, v: "$target");
          setState(() {});
        });
  });
}
