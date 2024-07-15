part of 'company_info_bloc.dart';

abstract class CompanyInfoState {}

class CompanyInfoInitial extends CompanyInfoState {}

class CompanyInfoLoading extends CompanyInfoState {}

class CompanyInfoFailure extends CompanyInfoState {
  final String errMessage;

  CompanyInfoFailure({required this.errMessage});
}

class CompanyInfoSuccess extends CompanyInfoState {
  final CompanyInfoModel companyInfo;

  CompanyInfoSuccess({required this.companyInfo});
}
