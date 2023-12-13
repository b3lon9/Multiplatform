import 'package:webview_flutter/webview_flutter.dart';

class HomeWebviewController extends WebViewController {

  HomeWebviewController() {
    
    setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        print('onPageStarted.. url:$url');
      },

      onPageFinished: (url) {
        print('onPageFinished.. url:$url');
      },

      onProgress: (progress) {
        print('onProgress.. progress:$progress');
      },

      /*onNavigationRequest: (request) {
        *//*
        * if (request.url.startsWith('https://www.youtube.com/') {
        *   return NavigationDecision.prevent;
        * } else {
        *   return NavigationDecision.navigate;
        * }
        * *//*
        return NavigationDecision.prevent;
      },*/

      onUrlChange: (change) {
        print('onUrlChange.. chage:$change');
      },

      onWebResourceError: (error) {
        print('onWebResourceError.. error:$error');
      },
    ));
    
    loadRequest(Uri.parse("https://www.naver.com"));
  }
}
