import 'package:flutter/material.dart';

class Player {
  String name;
  String? gender;

  Player({this.gender});
}

void main() {
  // runApp은 material에서 argument만 필요로 한다.
  // Widget은 레고라고 생각해주면 된다. 제공되는 Widget이 정말 많다.
  var player = Player(name: 'neander');
  player.name = 'kk';
  runApp(App());
}

// root
/// 총 3개의 앱이 있다
/// StatelessWidget
class App extends StatelessWidget {
  /// what is build method do?
  /// build메서드가 무엇이든 return하면 화면에 보여준다.
  /// make Widget's UI
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    // return MaterialApp  // Google
    // return CupertinoApp // Apple
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Flutter!'),
          centerTitle: true,
        ),
        body: Center( // center its child
          child: Text('Hello, World!'),
        ),
      ),    // home은 Widget이 되어야 한다.
    );
  }
}

// 앱을 만들기 전에 Scaffold가 필요하다. 앱의 구조, 건축 할 때 세우는 철근 같은 것
// new를 쓰든 안쓰든 동일하다.