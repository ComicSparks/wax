import 'package:flutter/gestures.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wax/basic/methods.dart';

import '../basic/commons.dart';
import '../screens/components/badge.dart';

const repoOwnerUrl = "https://api.github.com/repos/ComicSparks/glxx/releases/tags/wax";
const _releasesUrl = "https://github.com/OWNER/wax/releases";
const _versionUrl = "https://api.github.com/repos/OWNER/wax/releases/latest";
const _versionAssets = 'lib/assets/version.txt';
RegExp _versionExp = RegExp(r"^v\d+\.\d+.\d+$");

Future _openRelease() async {
  var owner = jsonDecode(await methods.httpGet(url: repoOwnerUrl))["body"].toString().trim();
    print("owner: $owner");
  openUrl(_releasesUrl.replaceAll("OWNER", owner));
}

late String _version;
String? _latestVersion;
String? _latestVersionInfo;

Future initVersion() async {
  // 当前版本
  try {
    _version = (await rootBundle.loadString(_versionAssets)).trim();
  } catch (e) {
    _version = "dirty";
  }
}

var versionEvent = Event<EventArgs>();

String currentVersion() {
  return _version;
}

String? latestVersion() {
  return _latestVersion;
}

String? latestVersionInfo() {
  return _latestVersionInfo;
}

Future autoCheckNewVersion() {
  return _versionCheck();
}

Future manualCheckNewVersion(BuildContext context) async {
  try {
    defaultToast(context, "检查新版本");
    await _versionCheck();
    defaultToast(context, "成功");
  } catch (e) {
    defaultToast(context, "失败" " : $e");
  }
}

bool dirtyVersion() {
  return !_versionExp.hasMatch(_version);
}

// maybe exception
Future _versionCheck() async {
  if (_versionExp.hasMatch(_version)) {
    var owner = jsonDecode(await methods.httpGet(url: repoOwnerUrl))["body"].toString().trim();
    print("owner: $owner");
    var json = jsonDecode(await methods.httpGet(url: _versionUrl.replaceAll("OWNER", owner)));
    if (json["name"] != null) {
      String latestVersion = (json["name"]);
      if (latestVersion != _version) {
        _latestVersion = latestVersion;
        _latestVersionInfo = json["body"] ?? "";
      }
    }
  } // else dirtyVersion
  versionEvent.broadcast();
}

String formatDateTimeToDateTime(DateTime c) {
  try {
    return "${add0(c.year, 4)}-${add0(c.month, 2)}-${add0(c.day, 2)} ${add0(c.hour, 2)}:${add0(c.minute, 2)}";
  } catch (e) {
    return "-";
  }
}

class VersionInfo extends StatefulWidget {
  const VersionInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VersionInfoState();
}

class _VersionInfoState extends State<VersionInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '软件版本 : $_version',
            style: const TextStyle(
              height: 1.3,
            ),
          ),
          Row(
            children: [
              const Text(
                "检查更新 : ",
                style: TextStyle(
                  height: 1.3,
                ),
              ),
              "dirty" == _version
                  ? _buildDirty()
                  : _buildNewVersion(_latestVersion),
              Expanded(child: Container()),
            ],
          ),
          _buildNewVersionInfo(_latestVersionInfo),
        ],
      ),
    );
  }

  Widget _buildNewVersion(String? latestVersion) {
    if (latestVersion != null) {
      return Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: VersionBadged(
                child: Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    latestVersion,
                    style: const TextStyle(height: 1.3),
                  ),
                ),
              ),
            ),
            const TextSpan(text: "  "),
            TextSpan(
              text: "去下载",
              style: TextStyle(
                height: 1.3,
                color: Theme.of(context).colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = _openRelease,
            ),
          ],
        ),
      );
    }
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: "未检测到新版本", style: TextStyle(height: 1.3)),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.only(left: 3, right: 3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          TextSpan(
            text: "检查更新",
            style: TextStyle(
              height: 1.3,
              color: Theme.of(context).colorScheme.primary,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => manualCheckNewVersion(context),
          ),
        ],
      ),
    );
  }

  Widget _buildDirty() {
    return VersionBadged(
      child: Text.rich(
        TextSpan(
          text: "下载RELEASE版     ",
          style: TextStyle(
            height: 1.3,
            color: Theme.of(context).colorScheme.primary,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = _openRelease,
        ),
      ),
    );
  }

  Widget _buildNewVersionInfo(String? latestVersionInfo) {
    if (latestVersionInfo != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const Text("更新内容:"),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              latestVersionInfo,
              style: TextStyle(),
            ),
          ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Container(
          padding: const EdgeInsets.all(15),
          child: Text.rich(
            TextSpan(
              text: "去RELEASE仓库",
              style: TextStyle(
                height: 1.3,
                color: Theme.of(context).colorScheme.primary,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = _openRelease,
            ),
          ),
        ),
      ],
    );
  }
}

var _display = true;

void versionPop(BuildContext context) {
  if (latestVersion() != null && _display) {
    _display = false;
    TopConfirm.topConfirm(
      context,
      "发现新版本",
      "发现新版本 ${latestVersion()} , 请到关于页面更新",
    );
  }
}

class TopConfirm {
  static topConfirm(BuildContext context, String title, String message,
      {Function()? afterIKnown}) {
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (
            BuildContext context,
            BoxConstraints constraints,
            ) {
          var mq = MediaQuery.of(context).size.width - 30;
          return Material(
            color: Colors.transparent,
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.35),
              ),
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: mq,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(height: 30),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                          ),
                        ),
                        Container(height: 15),
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Container(height: 25),
                        MaterialButton(
                          elevation: 0,
                          color: Colors.black.withOpacity(.1),
                          onPressed: () {
                            overlayEntry.remove();
                          },
                          child: const Text("朕知道了"),
                        ),
                        Container(height: 30),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          );
        },
      );
    });
    OverlayState? overlay = Overlay.of(context);
    if (overlay != null) {
      overlay.insert(overlayEntry);
    }
  }
}
