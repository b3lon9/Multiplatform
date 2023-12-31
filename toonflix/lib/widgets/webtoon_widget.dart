import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
              DetailScreen(title: title, thumb: thumb, id: id),
              fullscreenDialog: true
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 15,
                    offset: const Offset(10, 10))
              ], borderRadius: BorderRadius.circular(15)),
              child: Image.network(
                thumb,
                headers: const {'referer': 'https://comics.naver.com'},
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(title)
        ],
      ),
    );
  }
}
