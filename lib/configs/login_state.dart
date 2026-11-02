import 'package:event/event.dart';
import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/screens/site_login_screen.dart';

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

Future<bool> _openSiteLogin(BuildContext context,
    {required String path}) async {
  final ok = await Navigator.of(context).push<bool>(
    MaterialPageRoute(
      builder: (context) => SiteLoginScreen(path: path),
    ),
  );
  if (ok == true) {
    await reloadLogin();
    return true;
  }
  return false;
}

Future<bool> loginDialog(BuildContext context) {
  return _openSiteLogin(context, path: '/users-login.html');
}

Future<bool> registerDialog(BuildContext context) {
  return _openSiteLogin(context, path: '/users-reg.html');
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
      case LoginState.logging:
        break;
      case LoginState.success:
      case LoginState.fail:
      case LoginState.noLogin:
        loginDialog(context);
    }
  }
}
