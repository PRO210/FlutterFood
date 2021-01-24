import 'package:dio/dio.dart';
// import 'package:flutter_food/contants/api.dart';
import '../../../contants/api.dart';

Dio dioInterceptorAuth() {
  Dio dio = new Dio(); // with default Options

// Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMOUT;
  dio.options.headers['Accept'] = 'application/json';

  return dio;
}
