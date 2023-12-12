import 'package:flutter/material.dart';
import 'package:hybrid/webview/webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var webviewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) => print('onPageStated.. url:$url'),
        onPageFinished: (url) => print('onPageFinished.. url:$url'),
        onProgress: (progress) => print('onProgress.. progress:$progress'),
      )
    )
    ..loadRequest(Uri.parse("https://m.ssamplus.com/index_songcheck.asp"));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
          controller: webviewController,
        ),
    );
  }
}
