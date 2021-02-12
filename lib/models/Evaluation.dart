import 'dart:convert';

class Evaluation {
  String nameUser;
  double stars;
  String comment;

  Evaluation({this.nameUser, this.stars, this.comment});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.stars, this.total, this.contact);

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
        nameUser: jsonData['nameUser'],
        stars: double.parse(jsonData['stars'].toString()),
        comment: jsonData['comment']);
  }

  toJson() {
    return jsonEncode({
      'stars': stars,
      'nameUser': nameUser,
      'comment': comment,
    });
  }
}
