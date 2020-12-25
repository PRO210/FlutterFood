import 'package:flutter/material.dart';
import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';

// import 'package:flutter_food/widgets/flutter_bottom_navigator.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  //    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  List<Restaurant> _restaurants = [
    Restaurant(
      uuid: '32132165465',
      name: 'Espacializati',
      image: '',
      contact: 'contato@especializati.com.br',
    ),
    Restaurant(
      uuid: '3213216546502',
      name: 'Espacializati 02',
      image: '',
      contact: 'contato@especializati02.com.br',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: _builRestaurants(context),
      bottomNavigationBar: FlutterFoodBottomNavigator(0),
    );
  }

  //
  Widget _builRestaurants(context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Restaurant restaurant = _restaurants[index];

          return RestaurantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact,
          );
        },
        itemCount: _restaurants.length,
      ),
    );
  }
}
