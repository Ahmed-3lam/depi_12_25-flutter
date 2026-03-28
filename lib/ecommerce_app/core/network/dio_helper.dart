import 'package:depi_five/ecommerce_app/core/network/k_apis.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static final _dio = Dio();
  static void init() {
    _dio.options.baseUrl = KApis.baseUrl;
  }

  DioHelper._();

  static Future<Response> getData(String path) async {
    final response = await _dio.get(path);
    return response;
  }

  static Future<Response> postData(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final response = await _dio.post(path, data: body);
    return response;
  }
}
