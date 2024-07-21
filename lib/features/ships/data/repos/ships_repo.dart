import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/server_failure.dart';
import 'package:beyond_the_stars/core/networking/api_constants.dart';
import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ShipsRepo {
  final DioHelper dioHelper;

  ShipsRepo({required this.dioHelper});

  Future<Either<Failure, List<ShipsModel>>> getShips() async {
    try {
      final response = await dioHelper.get(endPoint: ApiConstants.ships);
      List<ShipsModel> ships = (response.data as List<dynamic>)
          .map((ship) => ShipsModel.fromJson(ship))
          .toList();

      return Right(ships);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
