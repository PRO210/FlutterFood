import 'package:flutter/material.dart';
import './screens/auth/register_page.dart';
import './screens/auth/login_page.dart';
import './screens/restaurants/restaurants_page.dart';

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
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/restaurants': (context) => RestaurantsPage(),
      },
    );
  }
}
