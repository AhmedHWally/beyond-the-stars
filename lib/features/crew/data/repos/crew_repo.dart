import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/server_failure.dart';
import 'package:beyond_the_stars/core/networking/api_constants.dart';
import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CrewRepo {
  final DioHelper dioHelper;

  CrewRepo({required this.dioHelper});

  Future<Either<Failure, List<CrewModel>>> getCrew() async {
    try {
      final response = await dioHelper.get(endPoint: ApiConstants.crew);
      List<CrewModel> crew = (response.data as List<dynamic>)
          .map((crewPerson) => CrewModel.fromJson(crewPerson))
          .toList();
      return Right(crew);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
