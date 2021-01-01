import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// import 'package:flutter_food/stores/foods.store.dart';
//import 'package:flutter_food/models/Category.dart';
//import 'package:flutter_food/screens/foods/widgets/Categories.dart';
//import 'package:flutter_food/widgets/food_card.dart';
// import 'package:flutter_food/models/Restaurant.dart';
// import 'package:flutter_food/contants/api.dart';

import '../../contants/api.dart';
import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../models/Restaurant.dart';
import './widgets/Categories.dart';
import '../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../stores/foods.store.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  Restaurant _restaurant;
  FoodStore storeFoods = new FoodStore();
  //
  List<Category> _categories = [
    Category(name: 'Hamburguer', description: 'ssd', identify: '01'),
    Category(name: 'Doces', description: 'ssd', identify: '02'),
    Category(name: 'Pizzas', description: 'ssd', identify: '03'),
  ];
  //
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    RouteSettings settings = ModalRoute.of(context).settings;
    _restaurant = settings.arguments;
    storeFoods.getFoods(_restaurant.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_restaurant.name}'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _buildScreen(),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
    );
  }

  Widget _buildScreen() {
    return Column(
      children: <Widget>[
        Categories(_categories),
        Observer(
          builder: (context) {
            return storeFoods.isLoading
                ? CircularProgressIndicator()
                : storeFoods.foods.length == 0
                    ? Center(
                        child: Text(
                          'Nenhum Produto :)',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      )
                    : _buildFoods();
          },
        )
      ],
    );
  }

  Widget _buildFoods() {
    return Container(
      height: (MediaQuery.of(context).size.height - 190),
      width: MediaQuery.of(context).size.width,
      //color: Colors.blueGrey,
      child: ListView.builder(
          itemCount: storeFoods.foods.length,
          itemBuilder: (context, index) {
            final Food food = storeFoods.foods[index];

            return FoodCard(
              identify: food.identify,
              description: food.description,
              image:
                  food.image.replaceAll('larafood', '${API_URL_NGROK_NUMBERS}'),
              // ('${API_URL_NGROK}storage/tenants/14e500e2-05a5-45af-a603-05c2df3ea4d8/products/0PKXHRIIYnqgtw7D4P42TUODyw8nlbDv5UV2QtEJ.jpeg'),
              price: food.price,
              title: food.title,
              notShowIconCart: false,
            );
          }),
    );
  }

  //
}
