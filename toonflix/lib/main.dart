import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/curreny_card.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        backgroundColor: const Color(0xFFE7626C),
      ),

      textTheme: const TextTheme(
        displayLarge : TextStyle(
          color: Color(0xFF232B55),
        ),
      ),
      cardColor: const Color(0xFFF4EDDB),
    ),
    home: const HomeScreen(),
  );
}