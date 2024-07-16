part of 'edit_profile_bloc.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {}

class EditProfileFailure extends EditProfileState {
  final String errorMessage;

  EditProfileFailure({required this.errorMessage});
}
