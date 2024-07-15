import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:beyond_the_stars/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.profileRepo) : super(ProfileInitial()) {
    on<GetProfileDataEvent>(_getProfileData);
  }
  final ProfileRepo profileRepo;

  void _getProfileData(
      GetProfileDataEvent event, Emitter<ProfileState> emit) async {
    var result = await profileRepo.getProfileData(id: AppStrings.userId);
    print(AppStrings.userId);
    result.fold(
      (failure) => emit(GetProfileDataFailure(errorMessage: failure.message)),
      (profile) => emit(GetProfileDataSuccess(profileData: profile)),
    );
  }
}
