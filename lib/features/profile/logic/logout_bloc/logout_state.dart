part of 'logout_bloc.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutFailure extends LogoutState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

class LogoutSuccess extends LogoutState {}
