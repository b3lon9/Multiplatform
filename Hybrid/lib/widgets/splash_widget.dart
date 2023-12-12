import 'package:flutter/material.dart';

import 'package:hybrid/widgets/home_widget.dart';


class SplashWidget extends StatefulWidget {

  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  final String TAG = "SplashWidget";
  bool isLoadComplete = false;

  void onNextProcess() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeWidget()),
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    print('$TAG.. initState.. before');

    // 1초 후 progressbar 표출
    Future.delayed(const Duration(seconds: 2), () {
      print('$TAG.. initState.. delay..');
      setState(() {
        isLoadComplete = true;
        onNextProcess();
      });
    });

    print('$TAG.. initState.. after');
  }

  @override
  void dispose() {
    super.dispose();
    print('$TAG.. dispose..');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/img_splash_bg.png',
            fit: BoxFit.fill,
          ),
          Visibility(
            visible: isLoadComplete,
            child: const Center(
              child: CircularProgressIndicator(),
            )
          ),
        ],
      ),
    );
  }
}
