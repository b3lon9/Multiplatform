

class WebtoonModel {
  final String title, thumb, id;

  /*WebtoonModel({
    required this.title,
    required this.thumb,
    required this.id
  });*/

  // Json형태로 바로 받아오고 싶은 경우
  // Json형태의 Constructor
  WebtoonModel.fromJson(Map<String, dynamic> json):
    title = json['title'],
    thumb = json['thumb'],
    id = json['id'];
}