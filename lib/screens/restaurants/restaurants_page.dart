import 'package:flutter/material.dart';

import '../../widgets/custon_circular_progress_indicator.dart';
import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';
import '../../data/network/repositories/restaurant_repository.dart';

class RestaurantsPage extends StatefulWidget {
  RestaurantsPage({Key key}) : super(key: key);

  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  //   SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  List<Restaurant> _restaurants = [];
  bool isLoanding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: isLoanding
          ? CustomCircularProgressIndicator(
              textLabel: 'Carregando os Restaurantes')
          : _builRestaurants(context),
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
            restaurant: restaurant,
          );
        },
        itemCount: _restaurants.length,
      ),
    );
  }

  void getRestaurants() async {
    setState(() => isLoanding = true);

    final restaurants = await RestaurantRepository().getRestaurants();
    setState(() {
      _restaurants.addAll(restaurants);
    });

    setState(() => isLoanding = false);
  }
}
