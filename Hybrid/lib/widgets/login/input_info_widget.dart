import 'package:flutter/material.dart';

class InfoInputWidget extends StatefulWidget {
  const InfoInputWidget({super.key});

  @override
  State<InfoInputWidget> createState() => _InfoInputWidgetState();
}

class _InfoInputWidgetState extends State<InfoInputWidget> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Color(0xffececec),
      ),
      child: Column(
        // 회원정보 입력창 & 로그인 버튼
        children: [
          // 회원정보 입력 창
          // ID입력
          SizedBox(
            height: 50,
            child: TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                  labelText: '아이디', border: OutlineInputBorder()),
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // PW입력
          SizedBox(
            height: 50,
            child: TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              obscureText: !isPasswordVisible,    // 비밀번호 암호화
              decoration: InputDecoration(
                labelText: '비밀번호',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: isPasswordVisible ? const Icon(Icons.visibility) :
                  const Icon(Icons.visibility_off),
                  onPressed: () {
                    print('ssssssssss');
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
          ),

          const SizedBox(height: 15,),

          // 로그인 버튼
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {},
            child: const Text('로그인'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 아이디 저장 체크박스
              Checkbox(
                onChanged: (isChecked) {},
                value: true,
              ),
              const Text('아이디 저장'),
            ],
          ),
        ],
      ),
    );
  }
}
