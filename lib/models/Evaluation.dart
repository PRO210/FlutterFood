import 'dart:convert';

import './User.dart';

class Evaluation {
  User user;
  double stars;
  String comment;

  Evaluation({this.user, this.stars, this.comment});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.stars, this.total, this.contact);

  factory Evaluation.fromJson(jsonData) {
    return Evaluation(
        user: User.fromJson(jsonData['client']),
        stars: double.parse(jsonData['stars'].toString()),
        comment: jsonData['comment']);
  }

  toJson() {
    return jsonEncode({
      'stars': stars,
      'user': user,
      'comment': comment,
    });
  }
}
