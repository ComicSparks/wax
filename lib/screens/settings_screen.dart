import 'package:flutter/material.dart';
import 'package:wax/configs/themes.dart';
import 'package:wax/configs/versions.dart';
import 'package:wax/screens/comic_histories_screen.dart';
import 'package:wax/screens/pro_screen.dart';

import '../configs/auto_clean.dart';
import '../configs/is_pro.dart';
import '../configs/login_state.dart';
import '../configs/view_log_clean.dart';
import '../configs/volume_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("设置"),
        actions: const [
          ProAction(),
        ],
      ),
      body: ListView(
        children: [
          const Divider(),
          const VersionInfo(),
          const Divider(),
          const LoginStateSetting(),
          const Divider(),
          ListTile(
            title: const Text("历史记录"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const ComicHistoriesScreen();
              }));
            },
          ),
          const Divider(),
          lightThemeSetting(),
          darkThemeSetting(),
          const Divider(),
          const Divider(),
          volumeControllerSetting(),
          const Divider(),
          viewLogCleanSetting(),
          autoCleanSetting(),
          const Divider(),
        ],
      ),
    );
  }
}

class ProAction extends StatefulWidget {
  const ProAction({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProActionState();
}

class _ProActionState extends State<ProAction> {

  @override
  void initState() {
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
    return proAction();
  }

  Widget proAction() {
    return IconButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return const ProScreen();
        }));
      },
      icon: Icon(
        isPro ? Icons.offline_bolt : Icons.offline_bolt_outlined,
      ),
    );
  }
}
