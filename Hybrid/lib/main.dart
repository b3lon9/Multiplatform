import 'package:flutter/material.dart';
import 'package:hybrid/widgets/splash_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hybrid Application',
      home: SplashWidget(),
    );
  }
}
