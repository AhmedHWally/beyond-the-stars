part of 'ships_bloc.dart';

abstract class ShipsState {}

class ShipsInitial extends ShipsState {}

class LoadShipsLoading extends ShipsState {}

class LoadShipsSuccess extends ShipsState {
  final List<ShipsModel> ships;

  LoadShipsSuccess({required this.ships});
}

class LoadShipsFailed extends ShipsState {
  final String errorMessage;

  LoadShipsFailed({required this.errorMessage});
}
