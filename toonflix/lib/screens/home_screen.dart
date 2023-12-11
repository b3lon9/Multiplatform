import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

// HomeScreen은 값을 받기 이전에 자신의 상태를 알 수 없기 때문에 const로 지정해주면 안된다.
class HomeScreen extends StatelessWidget{
  // const로 지정해주면 안되기 때문에 key값을 가지고 있어야 한다.
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text("오늘의 웹툰",
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      ),

      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          // futrue builder가 build에게 전달하는 내용
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(height: 50),
                Expanded(child: makeList(snapshot)),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var webtoon = snapshot.data![index];
                return Column(
                  children: [
                    Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(10, 10),
                            color: Colors.black.withOpacity(0.5)
                          ),
                        ],
                      ),
                      child: Image.network(
                        webtoon.thumb,
                        headers: const {'referer' : 'https://comic.naver.com'},
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(webtoon.title),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 40);
              },
            );
  }
}