import 'package:flutter/material.dart';

class InfoInputWidget extends StatelessWidget {
  const InfoInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Column(
              children: [
                TextField(
                ),
                TextField()
              ],
            ),
            ElevatedButton(
              onPressed: (){

              },
              child: const Text('로그인')
            )
          ],
        ),
        Checkbox(
          value: false,
          semanticLabel: "아이디 저장",
          onChanged: (isChecked) {

          }
        ),
      ],
    );
  }
}
