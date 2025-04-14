import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/screens/calculator_screen.dart';
import '../basic/commons.dart';
import '../configs/host.dart';
import '../configs/login_state.dart';
import '../configs/versions.dart';
import 'components/content_loading.dart';
import '../configs/is_pro.dart';
import 'app_screen.dart';

const firstLoginScreen = FirstLoginScreen();

class FirstLoginScreen extends StatefulWidget {
  const FirstLoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends State<FirstLoginScreen> {
  bool _logging = false;
  String _username = "";
  String _password = "";
  int _onClickVersion = 0;

  Widget _usernameField() {
    return ListTile(
      title: const Text("账号"),
      subtitle: Text(_username),
      onTap: () async {
        final input = await displayTextInputDialog(
          context,
          hint: "请输入账号",
          title: "账号",
          src: _username,
        );
        if (input != null) {
          setState(() {
            _username = input;
          });
        }
      },
    );
  }

  Widget _passwordField() {
    return ListTile(
      title: const Text("密码"),
      subtitle: Text(_password.isEmpty ? "" : '********'),
      onTap: () async {
        final input = await displayTextInputDialog(
          context,
          hint: "请输入密码",
          title: "密码",
          isPasswd: true,
          src: _password,
        );
        if (input != null) {
          setState(() {
            _password = input;
          });
        }
      },
    );
  }

  late final _saveButton = IconButton(
    onPressed: () async {
      setState(() {
        _logging = true;
      });
      try {
        await methods.login(_username, _password);
        try {
          await reloadIsPro();
        } catch (e, s) {
          print("$e\n$s");
        }
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return const AppScreen();
          },
        ));
      } catch (e, s) {
        print("$e\n$s");
        defaultToast(context, "$e", duration: 7);
        setState(() {
          _logging = false;
        });
      }
    },
    icon: const Icon(Icons.save),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        actions: _logging
            ? []
            : [
                SizedBox(
                  width: 80,
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        _onClickVersion++;
                      });
                      if (_onClickVersion >= 7) {
                        setState(() {
                          _logging = true;
                        });
                        try {
                          if (await registerDialog(context)) {
                            defaultToast(context, "注册成功", duration: 10);
                          }
                        } catch (e, s) {
                          print("$e\n$s");
                          defaultToast(context, "$e", duration: 8);
                        }
                        setState(() {
                          _logging = false;
                        });
                      }
                    },
                    icon: Text(currentVersion()),
                  ),
                ),
                _saveButton,
              ],
      ),
      body: _logging
          ? const Center(child: ContentLoading())
          : ListView(
              children: [
                _usernameField(),
                _passwordField(),
                hostSetting(),
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return const CalculatorScreen();
                          }),
                        );
                      },
                      child: const Text("计算器"),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ],
            ),
    );
  }
}
