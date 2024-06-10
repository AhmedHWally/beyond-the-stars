part of 'rockets_bloc.dart';

abstract class RocketsState {}

class RocketsInitial extends RocketsState {}

class GetRocketsLoading extends RocketsState {}

class GetRocketsSuccess extends RocketsState {
  final List<RocketModel> rockets;

  GetRocketsSuccess({required this.rockets});
}

class GetRocketsFailure extends RocketsState {
  final String errorMessage;

  GetRocketsFailure({required this.errorMessage});
}
