import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/configs/host.dart';
import 'package:wax/configs/is_pro.dart';
import 'package:wax/configs/no_reader_anime.dart';
import 'package:wax/configs/pager_column_number.dart';
import 'package:wax/configs/pager_controller_mode.dart';
import 'package:wax/configs/pager_view_mode.dart';

import '../configs/android_display_mode.dart';
import '../configs/android_version.dart';
import '../configs/app_orientation.dart';
import '../configs/auto_clean.dart';
import '../configs/download_thread_count.dart';
import '../configs/login_state.dart';
import '../configs/reader_controller_type.dart';
import '../configs/reader_direction.dart';
import '../configs/reader_slider_position.dart';
import '../configs/reader_type.dart';
import '../configs/themes.dart';
import '../configs/versions.dart';
import '../configs/view_log_clean.dart';
import '../configs/volume_controller.dart';
import 'app_screen.dart';
import 'calculator_screen.dart';
import 'first_login_screen.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  Future _init() async {
    await initAndroidVersion();
    await initAndroidDisplayMode();
    await initAutoClean();
    await initViewLogClean();
    await initReaderControllerType();
    await initReaderDirection();
    await initReaderSliderPosition();
    await initReaderType();
    await initVersion();
    await initTheme();
    await initPagerColumnCount();
    await initPagerControllerMode();
    await initPagerViewMode();
    await initHost();
    await initVolumeController();
    await initNoReaderAnime();
    await reloadIsPro();
    await initDownloadThreadCount();
    await initAppOrientation();
    autoCheckNewVersion();
    await initLogin();
    if (await methods.loadProperty(k: "last_username") == "" &&
        await methods.loadProperty(k: "ignoreLogin") == "") {
      Future.delayed(Duration.zero, () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) {
            // return firstLoginScreen;
            return const CalculatorScreen();
          }),
        );
      });
    } else {
      Future.delayed(Duration.zero, () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) {
            return const AppScreen();
          }),
        );
      });
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var width = 1024;
            var height = 1364;
            var min = constraints.maxWidth > constraints.maxHeight
                ? constraints.maxHeight
                : constraints.maxWidth;
            var newHeight = min;
            var newWidth = min * width / height;
            return Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.95, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: const Text("Initializing..."),
              ),
            );
          },
        ),
      ),
    );
  }
}
