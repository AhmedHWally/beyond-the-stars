part of 'add_user_to_fire_store_bloc.dart';

abstract class AddUserToFireStoreState {}

class AddUserToFireStoreInitial extends AddUserToFireStoreState {}

class AddUserLoading extends AddUserToFireStoreState {}

class AddUserSuccess extends AddUserToFireStoreState {}

class AddUserFailure extends AddUserToFireStoreState {
  final String errorMessage;
  AddUserFailure({required this.errorMessage});
}
