import 'package:appcep/model/back4app.model.dart';
import 'package:dio/dio.dart';

class CepBack4AppRepository {
  Future<Backs4AppModel> obterCep() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "RKR4qwr3APaXdhyCRj6UMY1NTgkGz0WGx84gnOsL";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "v4ANQN0CSNJZ1nzGq3h3IDIXzMNJLwWf3oAFQKA5";
    dio.options.headers["Content-Type"] = "application/json";
    var result = await dio.get("https://parseapi.back4app.com/classes/cep");
    //print(result.data);
    return Backs4AppModel.fromJson(result.data);
    //return result.data;
  }
}
