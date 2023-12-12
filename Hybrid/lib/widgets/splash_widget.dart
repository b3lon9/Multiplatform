import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'assets/images/img_splash_bg.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
