import 'package:flutter/material.dart';

// import 'package:flutter_food/screens/speech/speech_page.dart';
//import 'package:flutter_food/screens/profile/profile_page.dart';
// import 'package:flutter_food/screens/orders/orders_page.dart';
// import 'package:flutter_food/screens/carts/cart_page.dart';
// import 'package:flutter_food/screens/order_details/order_details.dart';
//import 'package:flutter_food/screens/evaluation_order/evaluation_order.dart';

import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/restaurants/restaurants_page.dart';
import './screens/foods/foods_page.dart';
import './screens/carts/cart_page.dart';
import './screens/orders/orders_page.dart';
import './screens/order_details/order_details.dart';
import './screens/evaluation_order/evaluation_order.dart';
import './screens/profile/profile_page.dart';
import './screens/speech/speech_page.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFood',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(147, 70, 248, 1),
          backgroundColor: Colors.white,
          accentColor: Colors.black,
          brightness: Brightness.dark),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => SpeechScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/restaurants': (context) => RestaurantsPage(),
        '/foods': (context) => FoodsScreen(),
        '/cart': (context) => CartScreen(),
        '/my-orders': (context) => OrdersScreen(),
        '/order-details': (context) => OrderDetailScreen(),
        '/evaluation-order': (context) => EvaluationOrderSreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
