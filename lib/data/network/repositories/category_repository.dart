import '../dio_client.dart';
import '../../../contants/api.dart';

class CategoryRepository {
  var _httpClient;

  CategoryRepository() {
    _httpClient = new DioClient();
  }

  Future<List<dynamic>> getCategories(String tokenCompany) async {
    final response = await _httpClient.get("$API_VERSION/categories",
        queryParameters: {'token_company': tokenCompany});
    //print(response);
    return (response.data['data'] as List).toList();
    // const API_URL = 'http://10.0.0.2/api/v1/products&token_company=fdsfs6d5f465';
  }
}
