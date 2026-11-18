import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';
import 'android_version.dart';

const _propertyName = "downloadForegroundNotice";

late bool downloadForegroundNotice;
Timer? _timer;
bool _syncing = false;

Future<void> initDownloadForegroundNotice() async {
  downloadForegroundNotice =
      (await methods.loadProperty(k: _propertyName)) == "true";
  if (downloadForegroundNotice && Platform.isAndroid) {
    _ensureWatching();
  }
}

void _ensureWatching() {
  _timer ??= Timer.periodic(const Duration(seconds: 4), (_) {
    _syncNotice();
  });
  _syncNotice();
}

void _stopWatching() {
  _timer?.cancel();
  _timer = null;
  methods.androidDownloadNotice(false);
}

Future<void> _syncNotice() async {
  if (_syncing || !Platform.isAndroid) {
    return;
  }
  _syncing = true;
  try {
    if (!downloadForegroundNotice) {
      await methods.androidDownloadNotice(false);
      return;
    }
    final list = await methods.downloads();
    final busy = list.downloads.any(
      (item) => !item.deleting && "${item.status}" == "0",
    );
    await methods.androidDownloadNotice(busy);
  } catch (_) {
  } finally {
    _syncing = false;
  }
}

Future<bool> _ensureNotificationPermission() async {
  if (androidVersion < 33) {
    return true;
  }
  if (await Permission.notification.isGranted) {
    return true;
  }
  return (await Permission.notification.request()).isGranted;
}

Widget downloadForegroundNoticeSetting() {
  return StatefulBuilder(
    builder: (BuildContext context, void Function(void Function()) setState) {
      return SwitchListTile(
        title: const Text("下载时使用常驻提醒"),
        value: downloadForegroundNotice,
        onChanged: (target) async {
          if (target) {
            final ok = await _ensureNotificationPermission();
            if (!ok) {
              if (context.mounted) {
                defaultToast(context, "没有通知权限，无法开启常驻提醒");
              }
              return;
            }
          }
          await methods.saveProperty(k: _propertyName, v: "$target");
          downloadForegroundNotice = target;
          if (target) {
            _ensureWatching();
          } else {
            _stopWatching();
          }
          setState(() {});
        },
      );
    },
  );
}
