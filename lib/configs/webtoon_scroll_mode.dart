import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

enum WebToonScrollMode {
  image,
  screen,
}

const _propertyName = "webtoonScrollMode";
late WebToonScrollMode _webToonScrollMode;

Future initWebToonScrollMode() async {
  _webToonScrollMode = _fromString(await methods.loadProperty(k: _propertyName));
}

WebToonScrollMode _fromString(String valueForm) {
  for (var value in WebToonScrollMode.values) {
    if (value.toString() == valueForm) {
      return value;
    }
  }
  return WebToonScrollMode.image;
}

WebToonScrollMode get currentWebToonScrollMode => _webToonScrollMode;

String webToonScrollModeName(WebToonScrollMode mode) {
  switch (mode) {
    case WebToonScrollMode.image:
      return "按图片";
    case WebToonScrollMode.screen:
      return "按屏幕";
  }
}

Future chooseWebToonScrollMode(BuildContext context) async {
  final Map<String, WebToonScrollMode> map = {};
  for (var element in WebToonScrollMode.values) {
    map[webToonScrollModeName(element)] = element;
  }
  final newMode = await chooseMapDialog(
    context,
    title: "请选择 WebToon 滚动方式",
    values: map,
  );
  if (newMode != null) {
    await methods.saveProperty(k: _propertyName, v: "$newMode");
    _webToonScrollMode = newMode;
  }
}
