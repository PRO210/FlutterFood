import 'dart:convert';

// import 'package:flutter_food/models/Food.dart';
import './Food.dart';
import './Evaluation.dart';

class Order {
  String identify;
  String date;
  String status;
  String table;
  double total;
  String comment;
  List<Food> foods;
  List<Evaluation> evaluation;

  Order(
      {this.identify,
      this.date,
      this.status,
      this.table,
      this.total,
      this.comment,
      this.foods,
      this.evaluation});
  //Passando entre couchettes eles ficam obrigatorios e precisam respeitar até a ordem
  // Restaurant(this.uuid, this.date, this.total, this.contact);

  factory Order.fromJson(jsonData) {
    return Order(
      identify: jsonData['identify'],
      date: jsonData['date'],
      status: jsonData['status'],
      table: jsonData['table'],
      total: double.parse(jsonData['total']),
      comment: jsonData['comment'],
      foods: jsonData['foods'],
      evaluation: jsonData['evaluation'],
    );
  }

  toJson() {
    return jsonEncode({
      'uuid': identify,
      'date': date,
      'identify': identify,
      'table': table,
      'total': total,
      'comment': comment,
      'foods': foods,
      'evaluation': evaluation,
    });
  }
}
