import 'package:flutter/material.dart';

// 코드 작성하는 것에 익숙해지자
class Button extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  Button({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 22
        ),
      ),
    ),
  );

}