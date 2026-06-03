import 'package:dio/dio.dart';
import 'package:gold_salver_prices/core/networking/api_constants.dart';

class DioHelper {

  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
      ),
    );
  }
  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    final response = await dio.get(
      endPoint,
      queryParameters: query,
    );
    return response;
  }
}