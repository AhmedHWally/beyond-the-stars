import 'package:beyond_the_stars/core/errors/failure.dart';
import 'package:beyond_the_stars/core/errors/server_failure.dart';
import 'package:beyond_the_stars/core/networking/api_constants.dart';
import 'package:beyond_the_stars/core/networking/dio_helper.dart';
import 'package:beyond_the_stars/features/company_info/data/models/company_info_model/company_info_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CompanyInfoRepo {
  final DioHelper dio;

  CompanyInfoRepo({required this.dio});

  Future<Either<Failure, CompanyInfoModel>> getCompanyInfo() async {
    try {
      final response = await dio.get(endPoint: ApiConstants.companyInfo);
      CompanyInfoModel companyInfoModel =
          CompanyInfoModel.fromJson(response.data);
      return right(companyInfoModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
