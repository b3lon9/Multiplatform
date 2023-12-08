import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/curreny_card.dart';

void main() {
  runApp(App());
}

// root
/// StatelessWidget
class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isShowTitle = true;

  void toggleTitle() {
    setState(() {
      isShowTitle = !isShowTitle;
    });
   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowTitle ? const MyLargeTitle() : const Text('nothing~!'),
              IconButton(onPressed: toggleTitle, icon: const   Icon(Icons.remove_red_eye))
            ],
          ),
        ),
      ),
    );
  }
}

// 상태를 사용하지 않기 때문에 StatefulWidget이 아니다.
// 하지만 이번 테스트에서 상태 변화를 알기 위해서 StatefulWidget으로 사용할 것이다.
class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {

  @override
  void initState() {
    super.initState();
    print('initState..');
  }


  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}

// 앱을 만들기 전에 Scaffold가 필요하다. 앱의 구조, 건축 할 때 세우는 철근 같은 것
// new를 쓰든 안쓰든 동일하다.
