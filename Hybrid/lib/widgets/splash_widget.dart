import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/data/constant.dart';

import 'package:hybrid/widgets/login_widget.dart';
import 'package:hybrid/util/animation_util.dart';

class SplashWidget extends StatefulWidget {

  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final String _tag = "SplashWidget";
  bool isLoadComplete = false;

  // 여기서 권한, 로그인 Cookie확인
  void onNextProcess() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.push(context, AnimationUtil.FadeRoute(const LoginWidget()));
      Navigator.pushAndRemoveUntil(
        context,
        AnimationUtil.FadeRoute(const LoginWidget()),
        (route) => false
      );
    });
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('$_tag.. initState.. ');
    }

    // 1초 후 progressbar 표출
    Future.delayed(const Duration(seconds: 2), () {
      if (kDebugMode) {
        print('$_tag.. initState.. ');
      }
      setState(() {
        isLoadComplete = true;
        onNextProcess();
      });
    });

  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print('$_tag.. dispose..');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Constant.imagePath.splashImg,
            fit: BoxFit.fill,
          ),
          Visibility(
            visible: isLoadComplete,
            child: const Center(
              child: CupertinoActivityIndicator(),
            )
          ),
        ],
      ),
    );
  }
}