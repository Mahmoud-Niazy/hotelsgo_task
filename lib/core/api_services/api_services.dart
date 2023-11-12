import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.hotelsgo.co/',
      ),
    );
  }

  Future<dynamic> getData({
    required String endPoint,
    Map<String,dynamic>? query,
  }) async{
    var response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response.data;
  }
}