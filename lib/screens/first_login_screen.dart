import 'package:flutter/material.dart';
import 'package:wax/screens/calculator_screen.dart';
import '../basic/commons.dart';
import '../configs/host.dart';
import '../configs/login_state.dart';
import '../configs/versions.dart';
import 'components/content_loading.dart';
import '../configs/is_pro.dart';
import 'app_screen.dart';
import 'site_login_screen.dart';

const firstLoginScreen = FirstLoginScreen();

class FirstLoginScreen extends StatefulWidget {
  const FirstLoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends State<FirstLoginScreen> {
  bool _logging = false;
  int _onClickVersion = 0;

  late final _saveButton = IconButton(
    onPressed: () async {
      final ok = await Navigator.of(context).push<bool>(
        MaterialPageRoute(builder: (context) => const SiteLoginScreen()),
      );
      if (ok != true || !mounted) {
        return;
      }
      setState(() {
        _logging = true;
      });
      try {
        await reloadLogin();
        try {
          await reloadIsPro();
        } catch (e, s) {
          print("$e\n$s");
        }
        if (!mounted) return;
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
                const ListTile(
                  title: Text("登录"),
                  subtitle: Text("在浏览器页面里完成登录和滑块验证，然后点右上角完成"),
                ),
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
