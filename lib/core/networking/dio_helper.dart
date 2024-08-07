import 'package:beyond_the_stars/core/networking/api_constants.dart';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  late Dio dio;

  DioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)));
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: true,
    ));
  }

  Future<Response> get(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await dio.get(endPoint, queryParameters: queryParameters);
  }
}
