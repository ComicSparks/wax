import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/screens/components/mouse_and_touch_scroll_behavior.dart';
import 'package:wax/src/rust/api/wax.dart';
import 'package:wax/src/rust/frb_generated.dart';
import 'package:window_manager/window_manager.dart';

import 'basic/commons.dart';
import 'configs/themes.dart';
import 'screens/init_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RustLib.init();
  if (Platform.isIOS) {
    final documents = await methods.iosGetDocumentDir();
    final support = await methods.iosGetApplicationSupportDir();
    await migration(source: documents, target: support);
    await initApplication(applicationDir: support);
  } else if (Platform.isAndroid) {
    final dir = await methods.androidDataLocal();
    await initApplication(applicationDir: dir);
  } else {
    await initApplication(applicationDir: '');
  }
  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    await _restoreDesktopWindow();
  }
  runApp(const MyApp());
}

Future<void> _restoreDesktopWindow() async {
  await windowManager.ensureInitialized();
  final width = int.tryParse(await methods.loadProperty(k: 'window_width')) ?? 600;
  final height = int.tryParse(await methods.loadProperty(k: 'window_height')) ?? 900;
  final full = await methods.loadProperty(k: 'full_screen') == 'true';
  await windowManager.waitUntilReadyToShow(
    WindowOptions(
      size: Size(
        (width <= 0 ? 600 : width).toDouble(),
        (height <= 0 ? 900 : height).toDouble(),
      ),
    ),
    () async {
      if (full) {
        await windowManager.maximize();
      }
      await windowManager.show();
      await windowManager.focus();
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WindowListener {
  @override
  void initState() {
    themeEvent.subscribe(_setState);
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      windowManager.addListener(this);
    }
    super.initState();
  }

  @override
  void dispose() {
    themeEvent.unsubscribe(_setState);
    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      windowManager.removeListener(this);
    }
    super.dispose();
  }

  _setState(_) => setState(() {});

  @override
  void onWindowResize() {
    windowManager.getSize().then((size) {
      methods.saveProperty(k: 'window_width', v: size.width.round().toString());
      methods.saveProperty(k: 'window_height', v: size.height.round().toString());
    });
  }

  @override
  void onWindowMaximize() {
    methods.saveProperty(k: 'full_screen', v: 'true');
  }

  @override
  void onWindowUnmaximize() {
    methods.saveProperty(k: 'full_screen', v: 'false');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: mouseAndTouchScrollBehavior,
      navigatorObservers: [routeObserver],
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const InitScreen(),
    );
  }
}
