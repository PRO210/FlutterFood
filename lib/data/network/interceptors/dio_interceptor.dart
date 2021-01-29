import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_food/contants/api.dart';
import '../../../contants/api.dart';

FlutterSecureStorage storage = new FlutterSecureStorage();
Dio dio = new Dio(); // with default Options

Dio dioInterceptor() {
// Set default configs
  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = API_CONECTION_TIMEOUT; //5s
  dio.options.receiveTimeout = API_RECEIVE_TIMOUT;

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) async {
      dio.options.headers['Accept'] = 'application/json';

      final String token = await storage.read(key: 'token_sanctum');
      if (token != null) {
        dio.options.headers['Authorization'] = 'Bearer' + token;
      }

      return options;
    },
  ));

  return dio;
}
