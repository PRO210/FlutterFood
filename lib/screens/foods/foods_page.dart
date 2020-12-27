import 'package:flutter/material.dart';
import 'package:flutter_food/contants/api.dart';

//import 'package:flutter_food/models/Category.dart';
//import 'package:flutter_food/screens/foods/widgets/Categories.dart';
//import 'package:flutter_food/widgets/food_card.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  //
  List<Category> _categories = [
    Category(name: 'Hamburguer', description: 'ssd', identify: '01'),
    Category(name: 'Doces', description: 'ssd', identify: '02'),
    Category(name: 'Pizzas', description: 'ssd', identify: '03'),
  ];
  //
  List<Food> _foods = [
    Food(
        identify: '01',
        image:
            '"${API_URL_NGROK}/storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/WSU8RnnhDWnL5kplbtPxnSb05vxECcKnOMf9aqUY.jpeg',
        description: 'Apenas teste',
        price: '10.20',
        title: 'Humburguer'),
    Food(
        identify: '02',
        image:
            '"${API_URL_NGROK}/storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/rrmzNZnvxPJp1HdQ0avY9br4xo4zaEOGbWi2Ec6N.jpeg',
        description: 'Apenas teste 02',
        price: '10.20',
        title: 'Açaí'),
    Food(
        identify: '03',
        image:
            '"${API_URL_NGROK}"/storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/0PKXHRIIYnqgtw7D4P42TUODyw8nlbDv5UV2QtEJ.jpeg',
        description: 'Apenas teste',
        price: '10.20',
        title: 'Pizzas')
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
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[Categories(_categories), _buildFoods()],
    );
  }

  Widget _buildFoods() {
    return Container(
      height: (MediaQuery.of(context).size.height - 190),
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
              notShowIconCart: false,
            );
          }),
    );
  }

  //
}
