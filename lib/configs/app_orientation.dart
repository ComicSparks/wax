// AppOrientation.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wax/basic/methods.dart';

import '../basic/commons.dart';
import '../protos/properties.pb.dart';

const _propertyName = "appOrientation";
late AppOrientation _appOrientation;

enum AppOrientation {
  normal,
  landscape,
  portrait,
}

String appOrientationName(AppOrientation type) {
  switch (type) {
    case AppOrientation.normal:
      return "正常";
    case AppOrientation.landscape:
      return "横屏";
    case AppOrientation.portrait:
      return "竖屏";
  }
}

Future initAppOrientation() async {
  var v = await methods.loadProperty(k: _propertyName);
  if (v.isEmpty) {
    _appOrientation = AppOrientation.normal;
  } else {
    _appOrientation = _fromString(v);
  }
  _set();
}

AppOrientation _fromString(String valueForm) {
  for (var value in AppOrientation.values) {
    if (value.toString() == valueForm) {
      return value;
    }
  }
  return AppOrientation.values.first;
}

AppOrientation get currentAppOrientation => _appOrientation;

Future chooseAppOrientation(BuildContext context) async {
  final Map<String, AppOrientation> map = {};
  for (var element in AppOrientation.values) {
    map[appOrientationName(element)] = element;
  }
  final newAppOrientation = await chooseMapDialog(
    context,
    values: map,
   title: "请选择APP方向",
  );
  if (newAppOrientation != null) {
    await methods.saveProperty(k: _propertyName, v: "$newAppOrientation");
    _appOrientation = newAppOrientation;
    _set();
  }
}

Widget appOrientationWidget() {
  if (!Platform.isAndroid && !Platform.isIOS) {
    return const SizedBox.shrink();
  }
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return ListTile(
        title: const Text("APP方向"),
        subtitle: Text(appOrientationName(_appOrientation)),
        onTap: () async {
          await chooseAppOrientation(context);
          setState(() {});
        },
      );
    },
  );
}

void _set() {
  if (Platform.isAndroid || Platform.isIOS) {
    switch (_appOrientation) {
      case AppOrientation.normal:
        SystemChrome.setPreferredOrientations([]);
        break;
      case AppOrientation.landscape:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        break;
      case AppOrientation.portrait:
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        break;
    }
  }
}
