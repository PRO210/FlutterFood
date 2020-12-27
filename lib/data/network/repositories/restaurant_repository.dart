// import 'package:flutter_food/data/network/dio_client.dart';
// import 'package:flutter_food/contants/api.dart';
// import 'package:flutter_food/models/Restaurant.dart';

import '../../../models/Restaurant.dart';
import '../../../contants/api.dart';
import '../dio_client.dart';

class RestaurantRepository {
  var _httpClient;
  RestaurantRepository() {
    _httpClient = new DioClient();
  }

  Future<List<Restaurant>> getRestaurants() async {
    final response = await _httpClient.get('$API_VERSION/tenants');
    final List _restaurants = (response.data['data'] as List).map((restaurant) {
      // _restaurants.add(Restaurant.fromJson(restaurant));
      return Restaurant.fromJson(restaurant);
    }).toList();
    return _restaurants;
  }
}
