import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

enum TwoPageDirection {
  leftToRight,
  rightToLeft,
}

const _propertyName = "twoPageDirection";
late TwoPageDirection _twoPageDirection;

Future initTwoPageDirection() async {
  _twoPageDirection = _fromString(await methods.loadProperty(k: _propertyName));
}

TwoPageDirection _fromString(String valueForm) {
  for (var value in TwoPageDirection.values) {
    if (value.toString() == valueForm) {
      return value;
    }
  }
  return TwoPageDirection.leftToRight;
}

TwoPageDirection get currentTwoPageDirection => _twoPageDirection;

String twoPageDirectionName(TwoPageDirection direction) {
  switch (direction) {
    case TwoPageDirection.leftToRight:
      return "从左到右";
    case TwoPageDirection.rightToLeft:
      return "从右到左";
  }
}

Future chooseTwoPageDirection(BuildContext context) async {
  final Map<String, TwoPageDirection> map = {};
  for (var element in TwoPageDirection.values) {
    map[twoPageDirectionName(element)] = element;
  }
  final newDirection = await chooseMapDialog(
    context,
    title: "请选择双页方向",
    values: map,
  );
  if (newDirection != null) {
    await methods.saveProperty(k: _propertyName, v: "$newDirection");
    _twoPageDirection = newDirection;
  }
}

