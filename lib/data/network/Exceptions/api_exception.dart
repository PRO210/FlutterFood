import 'package:dio/dio.dart';
import '../../../helpers/toast_helpers.dart';

class ApiException {
  Response<dynamic> response;

  ApiException(errorsResponse) {
    response = errorsResponse;
    showErrors();
  }

  showErrors() {
    print(toString());
    print(response);
    print(response.statusCode);
    print(response.data);

    if (response.statusCode == 422) {
      Map errors = response.data['errors'];

      if (errors != null) {
        String allErrors = "";

        errors.forEach((key, value) => allErrors + value[0] + "\n");

        FlutterFoodToast.error(allErrors);
        return;
      }

      FlutterFoodToast.error('Dados Invalidos');
      return;
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      FlutterFoodToast.error('Requisição Inválida');
      return;
    }

    FlutterFoodToast.error('Tente mais tarde por favor!');
    return;
  }
}
