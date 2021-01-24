import 'dart:convert';

class User {
  String name;
  String email;

  User({this.name, this.email});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.name, this.image, this.contact);

  factory User.fromJson(jsonData) {
    return User(
      name: jsonData['name'],
      email: jsonData['email'],
    );
  }

  toJson() {
    return jsonEncode({
      'name': name,
      'email': email,
    });
  }
}
