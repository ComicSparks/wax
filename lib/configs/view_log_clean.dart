import 'package:flutter/material.dart';
import '../basic/commons.dart';
import '../basic/methods.dart';

const _propertyName = "viewLog_clean";
late String viewLogClean;

Map<String, String> _nameMap(BuildContext context) => {
      (1000 * 3600 * 24 * 7).toString(): "一周",
      (1000 * 3600 * 24 * 30).toString(): "一月",
      (1000 * 3600 * 24 * 30 * 12).toString(): "一年",
    };

Future initViewLogClean() async {
  viewLogClean = await methods.loadProperty(k: _propertyName);
  if (viewLogClean == "") {
    viewLogClean = "${(1000 * 3600 * 24 * 30)}";
  }
  await methods.autoClearViewLog(time: int.parse(viewLogClean));
}

String viewLogCleanName(BuildContext context) {
  return _nameMap(context)[viewLogClean] ?? "-";
}

Future chooseViewLogClean(BuildContext context) async {
  String? choose = await chooseMapDialog(context,
      title: "阅读记录保存时长",
      values: _nameMap(context).map((key, value) => MapEntry(value, key)));
  if (choose != null) {
    await methods.saveProperty(k: _propertyName, v: choose);
    viewLogClean = choose;
  }
}

Widget viewLogCleanSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return ListTile(
        title: const Text("阅读记录保存时长"),
        subtitle: Text(viewLogCleanName(context)),
        onTap: () async {
          await chooseViewLogClean(context);
          setState(() {});
        },
      );
    },
  );
}
