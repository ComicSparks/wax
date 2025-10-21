import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';

import '../basic/commons.dart';

enum LoginState { logging, success, fail, noLogin }

LoginState _loginState = LoginState.logging;

LoginState get loginState => _loginState;

final Event loginEvent = Event();

Future initLogin() async {
  try {
    await methods.loginUser();
    _loginState = LoginState.success;
  } catch (e, s) {
    print("$e\n$s");
    if ("$e".contains("NO_LOGIN")) {
      _loginState = LoginState.noLogin;
    } else {
      _loginState = LoginState.fail;
    }
  }
}

Future reloadLogin() async {
  if (_loginState == LoginState.logging) {
    return;
  }
  _loginState = LoginState.logging;
  loginEvent.broadcast();
  try {
    await methods.loginUser();
    _loginState = LoginState.success;
  } catch (e, s) {
    print("$e\n$s");
    if ("$e".contains("NO_LOGIN")) {
      _loginState = LoginState.noLogin;
    } else {
      _loginState = LoginState.fail;
    }
  } finally {
    loginEvent.broadcast();
  }
}

class _LoginDialog extends StatefulWidget {
  const _LoginDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<_LoginDialog> {
  static var _username = "";
  static var _password = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 90,
      margin: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(child: Container()),
              ],
            ),
            ListTile(
              title: const Text("账号"),
              subtitle: Text(_username == "" ? "未设置" : _username),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _username,
                  title: '账号',
                  hint: '请输入账号',
                );
                if (input != null) {
                  setState(() {
                    _username = input;
                  });
                }
              },
            ),
            ListTile(
              title: const Text("密码"),
              subtitle: Text(_password == "" ? "未设置" : '\u2022' * 10),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _password,
                  title: '密码',
                  hint: '请输入密码',
                  isPasswd: true,
                );
                if (input != null) {
                  setState(() {
                    _password = input;
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.orange.shade700,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "取消",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.orange.shade700,
                    onPressed: () async {
                      Navigator.of(context)
                          .pop(methods.login(_username, _password));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "登录",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterDialog extends StatefulWidget {
  const _RegisterDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<_RegisterDialog> {
  static var _username = "";
  static var _password = "";
  static var _email = "";
  static var _nickname = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 90,
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(child: Container()),
                 Text(
                  "若看不到按钮请往下翻",
                  style: TextStyle(
                    color: Colors.grey.shade800,
                  ),
                ),
                Container(width: 10),
              ],
            ),
            ListTile(
              title: const Text("账号"),
              subtitle: Text(_username == "" ? "未设置" : _username),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _username,
                  title: '账号',
                  hint: '请输入账号',
                );
                if (input != null) {
                  setState(() {
                    _username = input;
                  });
                }
              },
            ),
            ListTile(
              title: const Text("密码"),
              subtitle: Text(_password == "" ? "未设置" : '\u2022' * 10),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _password,
                  title: '密码',
                  hint: '请输入密码',
                  isPasswd: true,
                );
                if (input != null) {
                  setState(() {
                    _password = input;
                  });
                }
              },
            ),
            ListTile(
              title: const Text("邮箱"),
              subtitle: Text(_email == "" ? "未设置" : _email),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _email,
                  title: '邮箱',
                  hint: '请输入邮箱',
                );
                if (input != null) {
                  setState(() {
                    _email = input;
                  });
                }
              },
            ),
            ListTile(
              title: const Text("昵称"),
              subtitle: Text(_nickname == "" ? "未设置" : _nickname),
              onTap: () async {
                String? input = await displayTextInputDialog(
                  context,
                  src: _nickname,
                  title: '昵称',
                  hint: '请输入昵称',
                );
                if (input != null) {
                  setState(() {
                    _nickname = input;
                  });
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.orange.shade700,
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "取消",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: Colors.orange.shade700,
                    onPressed: () async {
                      Navigator.of(context).pop(methods.register(
                        username: _username,
                        pass: _password,
                        passAgain: _password,
                        email: _email,
                        nickname: _nickname,
                        sex: '3',
                      ));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "注册",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> loginDialog(BuildContext context) async {
  Future? f = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: 30,
        height: 30,
        color: Colors.black.withOpacity(.1),
        child: const Center(
          child: _LoginDialog(),
        ),
      );
    },
  );
  if (f == null) {
    return false;
  }
  await f;
  await reloadLogin();
  return true;
}

Future<bool> registerDialog(BuildContext context) async {
  Future? f = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: 30,
        height: 30,
        color: Colors.black.withOpacity(.1),
        child: const Center(
          child: _RegisterDialog(),
        ),
      );
    },
  );
  if (f == null) {
    return false;
  }
  await f;
  return true;
}

class LoginStateSetting extends StatefulWidget {
  const LoginStateSetting({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginStateSettingState();
}

class _LoginStateSettingState extends State<LoginStateSetting> {
  @override
  void initState() {
    loginEvent.subscribe(_setState);
    super.initState();
  }

  @override
  void dispose() {
    loginEvent.unsubscribe(_setState);
    super.dispose();
  }

  void _setState(_) {
    super.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _loginStateAction(context);
      },
      title: Text(_loginStateText()),
    );
  }

  String _loginStateText() {
    switch (loginState) {
      case LoginState.logging:
        return "登录中";
      case LoginState.success:
        return "登录成功";
      case LoginState.fail:
        return "登录失败";
      case LoginState.noLogin:
        return "未登录";
    }
  }

  void _loginStateAction(BuildContext context) {
    switch (loginState) {
      case LoginState.success:
      case LoginState.fail:
      case LoginState.noLogin:
        loginDialog(context);
    }
  }
}
