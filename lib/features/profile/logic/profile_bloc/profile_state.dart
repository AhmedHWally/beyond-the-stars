part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileDataLoading extends ProfileState {}

class GetProfileDataSuccess extends ProfileState {
  final ProfileModel profileData;

  GetProfileDataSuccess({required this.profileData});
}

class GetProfileDataFailure extends ProfileState {
  final String errorMessage;

  GetProfileDataFailure({required this.errorMessage});
}
