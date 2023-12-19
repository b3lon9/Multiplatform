import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:toast/toast.dart';

import 'package:hybrid/widgets/home_widget.dart';
import 'package:hybrid/widgets/login/input_info_widget.dart';
import 'package:hybrid/util/animation_util.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> implements ClickListener {
  final String tag = "LoginWidget";

  // move WebView
  void moveHomeWidgetToWebView() {
    Navigator.pushAndRemoveUntil(
        context,
        AnimationUtil.FadeRoute(const HomeWidget()),
        (route) => false);
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('$tag.. initState..');
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('$tag.. dispose..');
    }
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,  // softkeyboard overflowed
      appBar: AppBar(
        title: const Text('Login Widget AppBar'),
      ),
      body: Column(
        children: [
          InfoInputWidget(this),
          const SizedBox(height: 16,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('회원가입'),
              Text('아이디/비밀번호 찾기')
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: (){}, child: Text('네이버 로그인')),
          ElevatedButton(onPressed: (){}, child: Text('카카오 로그인')),
        ],
      ),
    );
  }

  @override
  void onClick(String id, String pw) {
    print('onCLick........id:$id, pw:$pw');
    Toast.show("토스트 메시지 테스트", duration: 2, gravity: Toast.bottom);

    moveHomeWidgetToWebView();
  }
}
