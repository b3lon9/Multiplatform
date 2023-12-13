import 'package:flutter/material.dart';

import 'package:hybrid/widgets/home_widget.dart';
import 'package:hybrid/widgets/login/input_info_widget.dart';
import 'package:hybrid/util/animation_util.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final String tag = "LoginWidget";

  // move WebView
  moveHomeWidgetToWebView() {
   /* Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeWidget()),
        (route) => false
    );*/

    Navigator.pushAndRemoveUntil(
        context,
        AnimationUtil.FadeRoute(const HomeWidget()),
        (route) => false);

  }

  @override
  void initState() {
    super.initState();
    print('$tag.. initState..');
  }

  @override
  void dispose() {
    super.dispose();
    print('$tag.. dispose..');
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _tec = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Widget AppBar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'ID',
                              border: OutlineInputBorder()
                            ),
                          ),

                          SizedBox(height: 20,),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder()
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: moveHomeWidgetToWebView, child: Text('로그인'))
                ],
              ),
              Checkbox(
                value: false,
                onChanged: (isChecked) {
                  
                },
              ),
            ],
          ),
          const Row(
            children: [
              Text('회원가입'),
              Text('아이디/비밀번호 찾기')
            ],
          ),
          ElevatedButton(onPressed: (){}, child: Text('네이버 로그인')),
          ElevatedButton(onPressed: (){}, child: Text('카카오 로그인')),
        ],
      ),
    );
  }
}
