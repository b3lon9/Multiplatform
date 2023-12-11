import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev/';
  static final String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    print('getTodaysToons..');
    List<WebtoonModel> webtoonList = [];
    final url = Uri.parse('$baseUrl$today');

    print('getTodaysToons.. before response..');
    // 특정 URL을 보내는 것
    final response = await http.get(url); // future respons
    print('getTodaysToons.. after response..');

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // print('webtoon..:$webtoon');
        final toon = WebtoonModel.fromJson(webtoon);
        webtoonList.add(toon);
        print('toon:${toon.title }');
      }
      return webtoonList;
    }
    throw Error();
  }
}
