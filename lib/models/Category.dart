import 'dart:convert';

class Category {
  String identify;
  String name;
  String description;

  Category({this.identify, this.name, this.description});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.name, this.image, this.contact);

  factory Category.fromJson(jsonData) {
    return Category(
      identify: jsonData['identify'],
      name: jsonData['name'],
      description: jsonData['description'],
    );
  }

  toJson() {
    return jsonEncode({
      'identify': identify,
      'name': name,
      'description': description,
    });
  }
}
