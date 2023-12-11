import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: id,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              Container(
                width: 250,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(10, 10),
                    blurRadius: 15
                  )]
                ),
                child: Image.network(thumb, headers: const { 'referer':'https://comics.naver.com'},),
              ),
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),)
            ],
          ),
        ),
      ),
    );
  }
}
