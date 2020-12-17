import 'dart:convert';

class Food {
  String identify;
  String title;
  String description;
  String price;
  String image;

  Food({this.identify, this.title, this.description, this.price, this.image});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.title, this.image, this.contact);

  factory Food.fromJson(jsonData) {
    return Food(
      identify: jsonData['identify'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': identify,
      'title': title,
      'identify': identify,
      'price': price,
      'image': image,
    });
  }
}
