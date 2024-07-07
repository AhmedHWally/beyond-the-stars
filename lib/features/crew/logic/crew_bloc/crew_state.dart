part of 'crew_bloc.dart';

abstract class CrewState {}

class CrewInitial extends CrewState {}

class LoadCrewLoading extends CrewState {}

class LoadCrewSuccess extends CrewState {
  final List<CrewModel> crew;

  LoadCrewSuccess({required this.crew});
}

class LoadCrewFailure extends CrewState {
  final String errorMessage;

  LoadCrewFailure({required this.errorMessage});
}
