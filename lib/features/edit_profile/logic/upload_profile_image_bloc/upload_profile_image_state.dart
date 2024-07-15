part of 'upload_profile_image_bloc.dart';

abstract class UploadProfileImageState {}

class UploadProfileImageInitial extends UploadProfileImageState {}

class UploadProfileImageLoading extends UploadProfileImageState {}

class UploadProfileImageFailure extends UploadProfileImageState {
  final String errMessage;

  UploadProfileImageFailure({required this.errMessage});
}

class UploadProfileImageSuccess extends UploadProfileImageState {
  final String imageUrl;

  UploadProfileImageSuccess({required this.imageUrl});
}
