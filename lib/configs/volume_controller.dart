/// 音量键翻页

import 'dart:io';

import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

const _propertyName = "volumeController";
late bool volumeController;

Future<void> initVolumeController() async {
  volumeController = (await methods.loadProperty(k: _propertyName)) == "true";
}

Widget volumeControllerSetting() {
  if (Platform.isAndroid) {
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return SwitchListTile(
          title: const Text("阅读器音量键翻页"),
          value: volumeController,
          onChanged: (target) async {
            await methods.saveProperty(k: _propertyName, v: "$target");
            setState(() {});
          });
    });
  }
  return Container();
}
