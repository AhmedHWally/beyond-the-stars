part of 'launch_pad_bloc.dart';

abstract class LaunchPadState {}

class LaunchPadInitial extends LaunchPadState {}

class GetLaunchPadsLoading extends LaunchPadState {}

class GetLaunchPadsSuccess extends LaunchPadState {
  final List<LaunchPadModel> launchpads;

  GetLaunchPadsSuccess({required this.launchpads});
}

class GetLaunchPadsFailure extends LaunchPadState {
  final String errorMessage;

  GetLaunchPadsFailure({required this.errorMessage});
}
