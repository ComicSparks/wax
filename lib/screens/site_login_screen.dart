import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wax/basic/commons.dart';
import 'package:wax/basic/methods.dart';
import 'package:wax/configs/host.dart';

/// 与手机模式探测到的登录页一致，站点会按这个 UA 返回移动版登录（含滑块）。
const String _kMobileLoginUserAgent =
    'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) '
    'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 '
    'Mobile/15E148 Safari/604.1';

class SiteLoginScreen extends StatefulWidget {
  final String path;

  const SiteLoginScreen({
    Key? key,
    this.path = '/users-login.html',
  }) : super(key: key);

  @override
  State<SiteLoginScreen> createState() => _SiteLoginScreenState();
}

class _SiteLoginScreenState extends State<SiteLoginScreen> {
  final _progress = ValueNotifier<double>(0);
  bool _ready = false;
  bool _saving = false;
  InAppWebViewController? _controller;

  String get _origin {
    var root = host.trim();
    while (root.endsWith('/')) {
      root = root.substring(0, root.length - 1);
    }
    return root;
  }

  String get _pageUrl {
    final path = widget.path.startsWith('/') ? widget.path : '/${widget.path}';
    return '$_origin$path';
  }

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  Future<void> _prepare() async {
    try {
      await CookieManager.instance().deleteAllCookies();
    } catch (e, s) {
      print("$e\n$s");
    }
    if (!mounted) return;
    setState(() {
      _ready = true;
    });
  }

  Future<void> _finish() async {
    if (_saving) return;
    setState(() {
      _saving = true;
    });
    try {
      final cookies = await CookieManager.instance().getCookies(
        url: WebUri('$_origin/'),
        webViewController: _controller,
      );
      final cookieString = cookies
          .where((cookie) {
            final name = cookie.name.trim();
            final value = cookie.value;
            if (name.isEmpty || value == null) return false;
            return '$value'.trim().isNotEmpty;
          })
          .map((cookie) => '${cookie.name}=${cookie.value}')
          .join('; ');
      if (cookieString.isEmpty) {
        throw Exception('没有采集到 Cookie');
      }
      await methods.setCookies(cookieString);
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (e, s) {
      print("$e\n$s");
      if (!mounted) return;
      defaultToast(context, _loginError(e), duration: 7);
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
        });
      }
    }
  }

  String _loginError(Object error) {
    final text = '$error';
    if (text.contains('NO_LOGIN')) {
      return '还没有登录成功，请在页面里完成登录和滑块验证后再点完成';
    }
    if (text.contains('NO_COOKIE')) {
      return '没有采集到 Cookie';
    }
    return text;
  }

  bool get _webViewSupported =>
      Platform.isAndroid || Platform.isIOS || Platform.isMacOS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.path.contains('reg') ? '注册' : '登录'),
        actions: [
          ValueListenableBuilder<double>(
            valueListenable: _progress,
            builder: (context, value, _) {
              if (value <= 0 || value >= 1) return const SizedBox();
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: 120,
                    child: LinearProgressIndicator(value: value),
                  ),
                ),
              );
            },
          ),
          IconButton(
            tooltip: '完成',
            onPressed:
                (!_ready || _saving || !_webViewSupported) ? null : _finish,
            icon: _saving
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.check),
          ),
        ],
      ),
      body: !_webViewSupported
          ? const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('当前系统没有内置浏览器，请在 Android、iOS 或 macOS 上登录'),
              ),
            )
          : _ready
              ? InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(_pageUrl)),
                  initialSettings: InAppWebViewSettings(
                    javaScriptEnabled: true,
                    userAgent: _kMobileLoginUserAgent,
                    domStorageEnabled: true,
                    thirdPartyCookiesEnabled: true,
                    allowsInlineMediaPlayback: true,
                  ),
                  onWebViewCreated: (controller) {
                    _controller = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    _progress.value = progress / 100.0;
                  },
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}
