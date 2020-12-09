import 'package:flutter/material.dart';

//import 'package:flutter_food/models/Category.dart';
//import 'package:flutter_food/screens/foods/widgets/Categories.dart';
// import 'package:flutter_food/widgets/food_card.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  List<Category> _categories = [
    Category(name: 'Salgados', description: 'ssd', identify: '01'),
    Category(name: 'Refri', description: 'ssd', identify: '02'),
    Category(name: 'Doces', description: 'ssd', identify: '03'),
    Category(name: 'Pizzas', description: 'ssd', identify: '04'),
  ];
  List<Food> _foods = [
    Food(
        identify: 'asds',
        image: '',
        description: 'Apenas teste',
        price: '10.20',
        title: 'teste'),
    Food(
        identify: 'asds',
        image: '',
        description: 'Apenas teste 02',
        price: '10.20',
        title: 'teste'),
    Food(
        identify: 'asds',
        image: '',
        description: 'Apenas teste 03',
        price: '10.20',
        title: 'teste'),
    Food(
        identify: 'asds',
        image: '',
        description: 'Apenas teste',
        price: '10.20',
        title: 'teste')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de tenant'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[Categories(_categories), _buildFoods()],
    );
  }

  Widget _buildFoods() {
    return Container(
      height: (MediaQuery.of(context).size.height - 230),
      width: MediaQuery.of(context).size.width,
      //color: Colors.blueGrey,
      child: ListView.builder(
        itemCount: _foods.length,
        itemBuilder: (context, index) {
          final Food food = _foods[index];
          return FoodCard(
            identify: food.identify,
            description: food.description,
            image: food.image,
            price: food.price,
            title: food.title,
          );
        },
      ),
    );
  }
}
