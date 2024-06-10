import 'package:beyond_the_stars/core/networking/api_constants.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
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

  Future<List<RocketModel>> getAllRockets() async {
    var response = await dio.get(ApiConstants.rockets);
    List<RocketModel> rockets = (response.data as List<dynamic>)
        .map((rocket) => RocketModel.fromJson(rocket))
        .toList();
    return rockets;
  }

  Future<List<LaunchPadModel>> getAllLaunchPads() async {
    var response = await dio.get(ApiConstants.launchpads);
    List<LaunchPadModel> launchpads = (response.data as List<dynamic>)
        .map((launchPad) => LaunchPadModel.fromJson(launchPad))
        .toList();
    return launchpads;
  }
}
