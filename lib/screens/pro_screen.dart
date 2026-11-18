import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../basic/commons.dart';
import '../basic/methods.dart';
import '../configs/is_pro.dart';
import '../configs/login_state.dart';
import 'access_key_replace_screen.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  String _username = "";

  @override
  void initState() {
    methods.loadProperty(k: 'last_username').then((value) {
      setState(() {
        _username = value;
      });
    });
    proEvent.subscribe(_setState);
    super.initState();
  }

  @override
  void dispose() {
    proEvent.unsubscribe(_setState);
    super.dispose();
  }

  _setState(_) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var min = size.width < size.height ? size.width : size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("发电中心"),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: min / 2,
            height: min / 2,
            child: Center(
              child: Icon(
                isPro ? Icons.offline_bolt : Icons.offline_bolt_outlined,
                size: min / 3,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          _username.isEmpty
              ? Row(
                  children: [
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () async {
                        try {
                          if (await registerDialog(context)) {
                            defaultToast(context, "注册成功");
                          }
                        } catch (e) {
                          defaultToast(context, "$e", duration: 7);
                        }
                      },
                      child: Text(
                        "注册",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
                    const Text(" / "),
                    GestureDetector(
                      onTap: () async {
                        try {
                          if (await loginDialog(context)) {
                            defaultToast(context, "登录成功");
                          }
                        } catch (e) {
                          defaultToast(context, "$e");
                        } finally {
                          await reloadIsPro();
                          _username =
                              await methods.loadProperty(k: 'last_username');
                          setState(() {});
                        }
                      },
                      child: Text(
                        "登录",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                )
              : Center(child: Text(_username)),
          Container(height: 20),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "点击\"我曾经发过电\"进同步发电状态\n"
              "点击\"我刚才发了电\"兑换神秘代码\n"
              "去\"关于\"界面找到维护地址用爱发电\n"
              "更换\"发电方式\"可能解决FAIL问题",
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "发电小功能 \n"
              "  多线程下载\n"
              "  批量导入导出\n"
              "  跳页",
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("兑换发电"),
                  subtitle: Text(
                    proInfoAf.isPro
                        ? "发电中 (${DateTime.fromMillisecondsSinceEpoch(1000 * proInfoAf.expire).toString()})"
                        : "未发电",
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("PAT 会员"),
                  subtitle: Text(
                    proInfoPat.isPro ? "发电中" : "未发电",
                  ),
                  onTap: () {
                    defaultToast(context, "点击下方 PAT 会员修改");
                  },
                ),
              ),
            ],
          ),
          const Divider(),
          ListTile(
            title: const Text("我曾经发过电"),
            onTap: () async {
              if (_username.isEmpty) {
                defaultToast(context, "先登录");
                return;
              }
              try {
                await methods.reloadPro();
                defaultToast(context, "SUCCESS");
              } catch (e, s) {
                defaultToast(context, "FAIL");
              }
              await reloadIsPro();
              setState(() {});
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("我刚才发了电"),
            onTap: () async {
              if (_username.isEmpty) {
                defaultToast(context, "先登录");
                return;
              }
              final code = await displayTextInputDialog(context, title: "输入代码");
              if (code != null && code.isNotEmpty) {
                try {
                  await methods.inputCdKey(code);
                  defaultToast(context, "SUCCESS");
                } catch (e, s) {
                  defaultToast(context, "FAIL");
                }
              }
              await reloadIsPro();
              setState(() {});
            },
          ),
          const Divider(),
          const ProServerNameWidget(),
          const Divider(),
          ...patPro(),
          const Divider(),
          ReferralTiles(username: _username),
        ],
      ),
    );
  }

  List<Widget> patPro() {
    List<Widget> widgets = [];
    if (proInfoPat.accessKey.isNotEmpty) {
      var text = "已记录密钥";
      if (proInfoPat.patId.isNotEmpty) {
        text += "\nPAT账号 : ${proInfoPat.patId}";
      }
      if (proInfoPat.bindUid.isNotEmpty) {
        text += "\n绑定的Wax账号 : ${proInfoPat.bindUid}";
      }
      if (proInfoPat.requestDelete > 0) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          proInfoPat.requestDelete * 1000,
          isUtc: true,
        );
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
        text += "\n绑定账号时间 : $formattedDate";
      }
      if (proInfoPat.reBind > 0) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          proInfoPat.reBind * 1000,
          isUtc: true,
        );
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
        text += "\n可重新绑定时间 : $formattedDate";
      }
      List<TextSpan> append = [];
      if (proInfoPat.bindUid == "") {
        append.add(const TextSpan(
          text: "\n(请点击绑定到此账号)",
          style: TextStyle(color: Colors.blue),
        ));
      } else if (proInfoPat.bindUid != _username) {
        append.add(const TextSpan(
          text: "\n(绑定的账号不是当前账号)",
          style: TextStyle(color: Colors.red),
        ));
      } else if (proInfoPat.isPro == false) {
        append.add(const TextSpan(
          text: "\n(未检测到发电)",
          style: TextStyle(color: Colors.orange),
        ));
      } else {
        append.add(const TextSpan(
          text: "\n(正常)",
          style: TextStyle(color: Colors.green),
        ));
      }
      widgets.add(ListTile(
        onTap: () async {
          print(proInfoPat.toString());
          var choose = await chooseMapDialog<int>(
            context,
            title: "请选择",
            values: {
              "更新PAT状态": 2,
              "绑定到当前账号": 3,
              "修改PAT密钥": 1,
              "清空PAT信息": 4,
            },
          );
          switch (choose) {
            case 1:
              addPatAccount();
              break;
            case 2:
              reloadPatAccount();
              break;
            case 3:
              bindThisAccount();
              break;
            case 4:
              clearPat();
              break;
          }
        },
        title: const Text("PAT 会员"),
        subtitle: Text.rich(TextSpan(children: [
          TextSpan(text: text),
          ...append,
        ])),
      ));
    } else {
      widgets.add(ListTile(
        onTap: () {
          addPatAccount();
        },
        title: const Text("PAT 会员"),
        subtitle: const Text("点击绑定"),
      ));
    }
    return widgets;
  }

  void addPatAccount() async {
    print(proInfoPat.toString());
    String? key = await displayTextInputDialog(context, title: "输入授权码");
    if (key != null) {
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return AccessKeyReplaceScreen(accessKey: key);
      }));
    }
  }

  reloadPatAccount() async {
    defaultToast(context, "请稍候");
    try {
      await methods.reloadPatAccount();
      await reloadIsPro();
      defaultToast(context, "SUCCESS");
    } catch (e) {
      defaultToast(context, "FAIL : $e");
    } finally {
      setState(() {});
    }
  }

  bindThisAccount() async {
    defaultToast(context, "请稍候");
    try {
      await methods.bindThisAccount();
      await methods.reloadPatAccount();
      await reloadIsPro();
      defaultToast(context, "SUCCESS");
    } catch (e) {
      defaultToast(context, "FAIL : $e");
    } finally {
      setState(() {});
    }
  }

  clearPat() async {
    await methods.clearPat();
    await reloadIsPro();
    defaultToast(context, "Success");
    setState(() {});
  }
}

const _defaultProServerId = "ORI";

const _proServerIds = <String>[
  "ORI",
  "jdtvmstd22deytdzenvydyil3e0jkxfu",
  "mek5hrs65poai2eqjjofqr7ynu0nxkqx",
  "6h2odtaft7fuvssx6v5b73pwie0dfgvm",
  "ilsfsfkt75kp2nnfievnqcjmza0ooksc",
  "wuwjgjgautzqf6ybwmma6e2pw40iilcy",
  "phuto27lxoqo4skduakcs4siwu0ffwoh",
  "4sfkal33ch44fle6u6smhwufri0cmgnv",
];

final _proServerIdPattern = RegExp(r'^[a-z0-9]+$');
final _proServerRegionPattern = RegExp(r'^[a-z0-9]+(?:-[a-z0-9]+)+$');

class ProServerNameWidget extends StatefulWidget {
  const ProServerNameWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProServerNameWidgetState();
}

class _ProServerNameWidgetState extends State<ProServerNameWidget> {
  String _serverName = "";

  @override
  void initState() {
    methods.getProServerName().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        _serverName = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("发电方式"),
      subtitle: Text(_loadServerName()),
      onTap: () async {
        var serverName = await chooseMapDialog<String>(
          context,
          title: "选择发电方式",
          values: {
            for (final id in _proServerIds) id: id,
          },
        );
        if (serverName != null && serverName.isNotEmpty) {
          final name = serverName;
          await methods.setProServerName(name);
          if (!mounted) {
            return;
          }
          setState(() {
            _serverName = name;
          });
        }
      },
    );
  }

  String _loadServerName() {
    if (_proServerIds.contains(_serverName)) {
      return _serverName;
    }
    final parts = _serverName.split('|');
    if (parts.length == 2 &&
        _proServerIdPattern.hasMatch(parts[0]) &&
        _proServerRegionPattern.hasMatch(parts[1])) {
      return parts[0];
    }
    return _defaultProServerId;
  }
}

class ReferralTiles extends StatefulWidget {
  final String username;

  const ReferralTiles({Key? key, required this.username}) : super(key: key);

  @override
  State<ReferralTiles> createState() => _ReferralTilesState();
}

class _ReferralTilesState extends State<ReferralTiles> {
  bool _busy = false;
  String _referrer = "";
  int _unbindWaitDays = 0;
  int _campaignStart = 0;
  int _campaignEnd = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final raw = await methods.referralCall('{"action":"local"}');
      if (!mounted || raw.isEmpty) return;
      _apply(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {}
  }

  void _apply(Map<String, dynamic> data) {
    setState(() {
      _referrer = (data["referrer"] ?? "").toString();
      _unbindWaitDays = int.tryParse("${data["unbind_wait_days"]}") ?? 0;
      _campaignStart = int.tryParse("${data["campaign_start"]}") ?? 0;
      _campaignEnd = int.tryParse("${data["campaign_end"]}") ?? 0;
    });
  }

  Future<void> _referral(String payload, String ok) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      final raw = await methods.referralCall(payload);
      if (!mounted) return;
      if (raw.isNotEmpty) {
        _apply(jsonDecode(raw) as Map<String, dynamic>);
      }
      defaultToast(context, ok);
    } catch (e) {
      if (mounted) defaultToast(context, _referralError(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _when(int seconds) {
    if (seconds <= 0) return "";
    return DateFormat("yyyy-MM-dd HH:mm").format(
      DateTime.fromMillisecondsSinceEpoch(seconds * 1000, isUtc: true).toLocal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final campaign = _campaignStart > 0 && _campaignEnd > 0
        ? "${_when(_campaignStart)} — ${_when(_campaignEnd)}"
        : "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text("推荐人"),
          subtitle: Text(_referrer),
          onTap: () async {
            if (widget.username.isEmpty) {
              defaultToast(context, "先登录");
              return;
            }
            if (_referrer.isNotEmpty || _busy) return;
            final name = await displayTextInputDialog(context, title: "填写推荐人用户名");
            if (name == null || name.trim().isEmpty || !mounted) return;
            await _referral(
              jsonEncode({"action": "bind", "referrer": name.trim()}),
              "已绑定",
            );
          },
          onLongPress: () async {
            if (_referrer.isEmpty || _busy) return;
            if (_unbindWaitDays > 0) {
              defaultToast(context, "还要等 $_unbindWaitDays 天才能解绑");
              return;
            }
            final ok = await confirmDialog(context, "解绑推荐人", "确定解绑推荐人？");
            if (!ok || !mounted) return;
            await _referral('{"action":"unbind"}', "已解绑");
          },
        ),
        ListTile(
          title: const Text("活动时间"),
          subtitle: Text(campaign),
        ),
      ],
    );
  }
}

String _referralError(Object error) {
  final text = "$error";
  if (text.contains("REFERRER_SELF")) return "不能填自己";
  if (text.contains("REFERRER_MUTUAL")) return "不能互相推荐";
  if (text.contains("REFERRER_LOCKED")) return "已经绑定了推荐人";
  if (text.contains("REFERRER_UNBIND_WAIT:")) {
    final days = text.split("REFERRER_UNBIND_WAIT:").last.split(RegExp(r"\D")).first;
    return "还要等 $days 天才能解绑";
  }
  if (text.contains("REFERRER_NOT_BOUND")) return "还没有推荐人";
  if (text.contains("please login")) return "先登录";
  return "失败";
}
