part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent {}

class SaveEditedDataEvent extends EditProfileEvent {}

class CancelEditedDataEvent extends EditProfileEvent {}
