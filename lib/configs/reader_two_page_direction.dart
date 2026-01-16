import 'package:flutter/material.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';

enum ReaderTwoPageDirection {
  closeTo,
  pullAway,
  eachCentered,
}

const _propertyName = "readerTwoPageDirection";
late ReaderTwoPageDirection _readerTwoPageDirection;

Future initReaderTwoPageDirection() async {
  _readerTwoPageDirection =
      _fromString(await methods.loadProperty(k: _propertyName));
}

ReaderTwoPageDirection _fromString(String valueForm) {
  for (var value in ReaderTwoPageDirection.values) {
    if (value.toString() == valueForm) {
      return value;
    }
  }
  return ReaderTwoPageDirection.closeTo;
}

ReaderTwoPageDirection get currentReaderTwoPageDirection =>
    _readerTwoPageDirection;

String readerTwoPageDirectionName(ReaderTwoPageDirection direction) {
  switch (direction) {
    case ReaderTwoPageDirection.closeTo:
      return "靠近(中间贴合)";
    case ReaderTwoPageDirection.pullAway:
      return "远离(两侧贴合)";
    case ReaderTwoPageDirection.eachCentered:
      return "各自居中";
  }
}

Future chooseReaderTwoPageDirection(BuildContext context) async {
  final Map<String, ReaderTwoPageDirection> map = {};
  for (var element in ReaderTwoPageDirection.values) {
    map[readerTwoPageDirectionName(element)] = element;
  }
  final newDirection = await chooseMapDialog(
    context,
    title: "请选择双页排列",
    values: map,
  );
  if (newDirection != null) {
    await methods.saveProperty(k: _propertyName, v: "$newDirection");
    _readerTwoPageDirection = newDirection;
  }
}

