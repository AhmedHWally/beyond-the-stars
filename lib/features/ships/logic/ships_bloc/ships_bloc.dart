import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:beyond_the_stars/features/ships/data/repos/ships_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ships_event.dart';
part 'ships_state.dart';

class ShipsBloc extends Bloc<ShipsEvent, ShipsState> {
  ShipsBloc(this.shipsRepo) : super(ShipsInitial()) {
    on<LoadShipsEvent>(_loadShips);
  }
  final ShipsRepo shipsRepo;
  _loadShips(LoadShipsEvent event, Emitter<ShipsState> emit) async {
    emit(LoadShipsLoading());
    var result = await shipsRepo.getShips();
    result.fold(
        (failure) => emit(LoadShipsFailed(errorMessage: failure.message)),
        (ships) => emit(LoadShipsSuccess(ships: ships)));
  }
}
