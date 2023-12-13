import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybrid/widgets/web/webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isPageLoadFinished = false;

  var webviewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (url) => print('onPageStated.. url:$url'),
        onPageFinished: (url) => print('onPageFinished.. url:$url'),
        onProgress: (progress) => print('onProgress.. progress:$progress'),
        onNavigationRequest: (request) {
          print('onNavigationRequest.. $request');

          // 다른 페이지로 이동하지 않게 막음
          return NavigationDecision.navigate;
        },
      )
    )
    ..loadRequest(Uri.parse("https://m.ssamplus.com/index_songcheck.asp"));


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (await webviewController.canGoBack()) {
          webviewController.goBack();
        } else {
          SystemNavigator.pop(animated: true);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            WebViewWidget(
              controller: webviewController,
            ),
            const Center(child: CupertinoActivityIndicator()),
          ],
        ),
      ),
    );
  }
}
