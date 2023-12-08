import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// clone coding
///
/// @override
/// State<HomeScreen> createState() => _HomeScreenState();
///
/// class _HomeScreenState extends State<HomeScreen> {
///   @override
///   Widget build(BuildContext context) { return Widget }
/// }

class _HomeScreenState extends State<HomeScreen> {
  static const int twentyFiveMinutes = 1500;

  late Timer timer;

  int totalSeconds = 10;
  int totalPomodors = 0;
  bool isRunning = false;

  // 1초마다 UI갱신, 빌드
  void onTick(Timer timer) {
    setState(() {
      totalSeconds--;

      if (totalSeconds <= 0) {
        totalSeconds = twentyFiveMinutes;
        totalPomodors++;
        isRunning = false;
        timer.cancel();
      }
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();

    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    print('onResetPressed..');
    if (timer != null && timer.isActive) {
      timer.cancel();
    }

    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });

  }

  // Text위젯에서 실행한다.
  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    print('duration:$duration');
    // split방법
    // duration.toString().split(".") // dot으로 문자를 나눈다
    // String arrayDuration = duration.toString().split('.')[0]; .split(':');
    String arrayDuration = duration.toString().split('.').first.substring(2, 7);
    /*print(arrayDuration);*/

    /*final stringBuffer = StringBuffer();
    for (var i in arrayDuration) {
      if (int.parse(i) > 0) {
        stringBuffer.write(i);
      }
    }
    print('stringBuffer:$stringBuffer');
*/
    return arrayDuration;
  }


  @override
  void initState() {
    super.initState();
    print('initState..');
  }


  @override
  void dispose() {
    super.dispose();
    print('dispose..');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning ? Icons.pause_circle_outline : Icons.play_circle_outline),
                  ),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
                    ),
                    onPressed: onResetPressed,
                    child: Text('reset',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    )
                  ),
                ],
              ),
            )
          ),

          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: Theme.of(context).cardColor
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.displayLarge!.color
                          ),
                        ),
                        Text('$totalPomodors',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).textTheme.displayLarge!.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
