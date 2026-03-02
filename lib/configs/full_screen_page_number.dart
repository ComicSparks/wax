import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

enum FullScreenPageNumberPosition {
  topLeft,
  bottomLeft,
  topRight,
  bottomRight,
}

const _showPropertyName = "full_screen_show_page_number";
const _positionPropertyName = "full_screen_page_number_position";

const _positionNames = {
  FullScreenPageNumberPosition.topLeft: '左上',
  FullScreenPageNumberPosition.bottomLeft: '左下',
  FullScreenPageNumberPosition.topRight: '右上',
  FullScreenPageNumberPosition.bottomRight: '右下',
};

late bool fullScreenShowPageNumber;
late FullScreenPageNumberPosition fullScreenPageNumberPosition;

Future<void> initFullScreenPageNumber() async {
  fullScreenShowPageNumber =
      (await methods.loadProperty(k: _showPropertyName)) == "true";
  fullScreenPageNumberPosition = _positionFromString(
    await methods.loadProperty(k: _positionPropertyName),
  );
}

FullScreenPageNumberPosition _positionFromString(String value) {
  for (final p in FullScreenPageNumberPosition.values) {
    if (value == p.toString()) {
      return p;
    }
  }
  return FullScreenPageNumberPosition.bottomRight;
}

String get fullScreenPageNumberPositionName =>
    _positionNames[fullScreenPageNumberPosition] ?? "";

Future<void> setFullScreenShowPageNumber(bool value) async {
  await methods.saveProperty(k: _showPropertyName, v: "$value");
  fullScreenShowPageNumber = value;
}

Future<void> chooseFullScreenPageNumberPosition(BuildContext context) async {
  final map = <String, FullScreenPageNumberPosition>{};
  _positionNames.forEach((key, value) {
    map[value] = key;
  });
  final result = await chooseMapDialog<FullScreenPageNumberPosition>(
    context,
    title: "全屏页数位置",
    values: map,
  );
  if (result != null) {
    await methods.saveProperty(k: _positionPropertyName, v: result.toString());
    fullScreenPageNumberPosition = result;
  }
}

Widget fullScreenPageNumberSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return Column(
        children: [
          SwitchListTile(
            title: const Text("全屏时仍然显示页数"),
            value: fullScreenShowPageNumber,
            onChanged: (target) async {
              await setFullScreenShowPageNumber(target);
              setState(() {});
            },
          ),
          if (fullScreenShowPageNumber)
            ListTile(
              title: const Text("全屏时显示页数位置"),
              subtitle: Text(fullScreenPageNumberPositionName),
              onTap: () async {
                await chooseFullScreenPageNumberPosition(context);
                setState(() {});
              },
            ),
        ],
      );
    },
  );
}
