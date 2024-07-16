import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/features/edit_profile/data/repos/edit_profile_repo.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this.editProfileRepo) : super(EditProfileInitial()) {
    on<SaveEditedDataEvent>(_saveEditedData);
    on<CancelEditedDataEvent>(_cancelEditedData);
  }
  final EditProfileRepo editProfileRepo;
  String name = '';
  String imagePath = '';
  String imageUrl = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  _saveEditedData(
      SaveEditedDataEvent event, Emitter<EditProfileState> emit) async {
    emit(EditProfileLoading());
    var result = await editProfileRepo.updateProfile(
        profileData:
            ProfileModel(name: name, image: imageUrl, id: AppStrings.userId));

    result.fold(
        (failure) => emit(EditProfileFailure(errorMessage: failure.message)),
        (unit) => emit(EditProfileSuccess()));
  }

  _cancelEditedData(
      CancelEditedDataEvent event, Emitter<EditProfileState> emit) async {
    var result = await editProfileRepo.deleteProfileImage(imagePath);
    result.fold(
        (failure) => emit(EditProfileFailure(errorMessage: failure.message)),
        (unit) => emit(EditProfileSuccess()));
  }
}
