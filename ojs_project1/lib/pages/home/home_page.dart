import 'package:flutter/material.dart';

import 'package:ojs_project1/pages/home/screens/first_screen.dart';
import 'package:ojs_project1/pages/home/screens/second_screen.dart';
import 'package:ojs_project1/pages/home/screens/third_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  var _screens = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '복잡한 UI',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),

      body: _screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'service',
            icon: Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            label: 'my info',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
