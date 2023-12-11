import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:toonflix/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // stateful로 접근해야 한다
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    // widget이라는 것은 부모의 값

    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Hero(
            tag: widget.id,

            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 50),
              child: Column(
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
                    child: Image.network(widget.thumb, headers: const { 'referer':'https://comic.naver.com'},),
                  ),
                  Text(widget.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),

                  const SizedBox(height: 30,),

                  FutureBuilder(
                      future: webtoon,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.about,
                                style: const TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              const SizedBox(height: 15,),
                              // text interpolation
                              Text('${snapshot.data!.genre}/${snapshot.data!.age}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                  ),

                  const SizedBox(height: 50,),
                  FutureBuilder(
                    future: episodes,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            for (var episode in snapshot.data!)
                              Episode(episode: episode, webtoonId: widget.id)   // import하는 부분에 대문자가 입력되어 에러발샐
                          ],
                        );
                      } else {
                        return const Text('...');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

