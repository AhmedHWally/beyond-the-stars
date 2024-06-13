import 'dart:developer';

import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/server_failure.dart';
import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/core/utils/rockets_and_launchpads_cache_helper.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RocketRepo {
  final DioHelper dioHelper;

  RocketRepo({required this.dioHelper});

  Future<Either<Failure, List<RocketModel>>> getAllRockets() async {
    try {
      List<RocketModel> rockets =
          RocketsAndLaunchpadsCacheHelper.getCachedRocketsData();
      if (rockets.isNotEmpty) {
        log('data stored');
        return right(rockets);
      }
      rockets = await dioHelper.getAllRockets();
      RocketsAndLaunchpadsCacheHelper.cacheRocketsData(rockets);
      return right(rockets);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
