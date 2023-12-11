import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({
    super.key,
    required this.episode,
    required this.webtoonId
  });

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onButtonTab() async {
    // final url = Uri.parse("https://google.com");
    // await launchUrlString("https://google.com");
    await launchUrlString("https://comic.naver.com/webtoon/detail?titleId=${webtoonId}&no=${episode.id}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTab,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.green.shade300,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green.shade900, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(episode.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                color: Colors.white,),
            ],
          ),
        ),
      ),
    );
  }
}