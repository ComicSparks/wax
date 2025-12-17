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
              "\"FAIL\"请尝试更换您的网络或发电方式",
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
                        ? "发电中 (${DateTime.fromMillisecondsSinceEpoch(1000 * proInfoAf.expire.toInt()).toString()})"
                        : "未发电",
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Patreon 会员"),
                  subtitle: Text(
                    proInfoPat.isPro ? "发电中" : "未发电",
                  ),
                  onTap: () {
                    defaultToast(context, "点击下方 Patreon 会员修改");
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
        ],
      ),
    );
  }

  List<Widget> patPro() {
    List<Widget> widgets = [];
    if (proInfoPat.accessKey.isNotEmpty) {
      var text = "已记录密钥";
      if (proInfoPat.patId.isNotEmpty) {
        text += "\nPatreon账号 : ${proInfoPat.patId}";
      }
      if (proInfoPat.bindUid.isNotEmpty) {
        text += "\n绑定的Wax账号 : ${proInfoPat.bindUid}";
      }
      if (proInfoPat.requestDelete > 0) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          proInfoPat.requestDelete.toInt() * 1000,
          isUtc: true,
        );
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime.toLocal());
        text += "\n绑定账号时间 : $formattedDate";
      }
      if (proInfoPat.reBind > 0) {
        DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          proInfoPat.reBind.toInt() * 1000,
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
              "更新Patreon状态": 2,
              "绑定到当前账号": 3,
              "修改Patreon密钥": 1,
              "清空Patreon信息": 4,
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
        title: const Text("Patreon 会员"),
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
        title: const Text("Patreon 会员"),
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
        final serverName = await chooseMapDialog(
          context,
          title: "选择发电方式",
          values: {
            "核能发电": "JP",
            "风力发电": "HK",
            "水力发电": "US",
          },
        );
        if (serverName != null && serverName.isNotEmpty) {
          await methods.setProServerName(serverName);
          setState(() {
            _serverName = serverName;
          });
        }
      },
    );
  }

  String _loadServerName() {
    switch (_serverName) {
      case "JP":
        return "核能发电";
      case "HK":
        return "风力发电";
      case "US":
        return "水力发电";
      default:
        return "";
    }
  }
}
