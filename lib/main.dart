import 'package:flutter/material.dart';

// import 'package:flutter_food/contants/app_theme.dart';
// import 'package:flutter_food/routes.dart';
import './routes.dart';
import './contants/app_theme.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterFood',
      theme: themeData,
      initialRoute: '/',
      routes: Routes.routes,
    );
  }
}
