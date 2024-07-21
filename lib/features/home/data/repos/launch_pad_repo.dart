import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/server_failure.dart';
import 'package:beyond_the_stars/core/networking/api_constants.dart';
import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/core/utils/rockets_and_launchpads_cache_helper.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LaunchPadRepo {
  final DioHelper dioHelper;

  LaunchPadRepo({required this.dioHelper});

  Future<Either<Failure, List<LaunchPadModel>>> getAllLaunchPads() async {
    try {
      List<LaunchPadModel> launchPads =
          RocketsAndLaunchpadsCacheHelper.getCachedLaunchPadData();
      if (launchPads.isNotEmpty) {
        return right(launchPads);
      }

      final response = await dioHelper.get(endPoint: ApiConstants.launchpads);
      launchPads = (response.data as List<dynamic>)
          .map((launchPad) => LaunchPadModel.fromJson(launchPad))
          .toList();

      RocketsAndLaunchpadsCacheHelper.cacheLaunchPadData(launchPads);
      return right(launchPads);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
