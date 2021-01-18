import 'package:flutter/material.dart';
import './stores/restaurant.store.dart';
import './stores/categories.store.dart';
import './stores/foods.store.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './contants/app_theme.dart';

void main() => runApp(FlutterFoodApp());

class FlutterFoodApp extends StatelessWidget {
  const FlutterFoodApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FoodsStore>(
          create: (_) => FoodsStore(),
        ),
        Provider<CategoriesStore>(
          create: (_) => CategoriesStore(),
        ),
        Provider<RestaurantsStore>(
          create: (_) => RestaurantsStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterFood',
        theme: themeData,
        initialRoute: '/',
        routes: Routes.routes,
      ),
    );
  }
}
