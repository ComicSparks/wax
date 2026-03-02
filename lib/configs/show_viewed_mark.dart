import 'package:flutter/material.dart';

import '../basic/methods.dart';

const _propertyName = "showViewedMark";
late bool showViewedMark;

Future<void> initShowViewedMark() async {
  showViewedMark = (await methods.loadProperty(k: _propertyName)) == "true";
}

Widget showViewedMarkSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return SwitchListTile(
        title: const Text("显示看过标识"),
        value: showViewedMark,
        onChanged: (target) async {
          await methods.saveProperty(k: _propertyName, v: "$target");
          setState(() {
            showViewedMark = target;
          });
        },
      );
    },
  );
}
