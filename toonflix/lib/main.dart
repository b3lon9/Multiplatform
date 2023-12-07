import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/curreny_card.dart';

class Player {
  String name;
  String? gender;

  Player({required this.name});
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
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              // first row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hey, Neander',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Welcom back',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),

              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
              Text(
                '\$5 194 482',
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      text: 'Transfer',
                      bgColor: Colors.amber,
                      textColor: Colors.black),
                  Button(
                      text: 'Request',
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white),
                ],
              ),

              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Wallets',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CurrenyCard(name: "Euro", code: 'EUR', amount: '6 428', icon: Icons.euro_outlined, isInverted: true),
              Transform.translate(
                offset: const Offset(0, -20),
                child: const CurrenyCard(name: 'Bitcoin', code: 'BTC', amount: '9 785', icon: Icons.currency_bitcoin, isInverted: false)
              ),
              Transform.translate(
                offset: Offset(0, -40),
                child: const CurrenyCard(name: 'Dollar', code: 'USD', amount: '6 428', icon: Icons.money, isInverted: true)
              ),
            ],
          ),
        ),
      ), // home은 Widget이 되어야 한다.
    );
  }
}

// 앱을 만들기 전에 Scaffold가 필요하다. 앱의 구조, 건축 할 때 세우는 철근 같은 것
// new를 쓰든 안쓰든 동일하다.
