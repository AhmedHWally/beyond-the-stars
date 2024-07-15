import 'package:beyond_the_stars/features/company_info/data/models/company_info_model/company_info_model.dart';
import 'package:beyond_the_stars/features/company_info/data/repos/company_info_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'company_info_event.dart';
part 'company_info_state.dart';

class CompanyInfoBloc extends Bloc<CompanyInfoEvent, CompanyInfoState> {
  CompanyInfoBloc(this.companyInfoRepo) : super(CompanyInfoInitial()) {
    on<LoadCompanyInfo>(_loadCompanyInfo);
  }
  final CompanyInfoRepo companyInfoRepo;

  _loadCompanyInfo(
      LoadCompanyInfo event, Emitter<CompanyInfoState> emit) async {
    emit(CompanyInfoLoading());
    var result = await companyInfoRepo.getCompanyInfo();
    result.fold(
        (failure) => emit(CompanyInfoFailure(errMessage: failure.message)),
        (companyInfo) => emit(CompanyInfoSuccess(companyInfo: companyInfo)));
  }
}
