import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/data/repos/rocket_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rockets_event.dart';
part 'rockets_state.dart';

class RocketsBloc extends Bloc<RocketsEvent, RocketsState> {
  RocketsBloc(this.rocketRepo) : super(RocketsInitial()) {
    on<GetAllRocketsEvent>(_getAllRockets);
  }
  final RocketRepo rocketRepo;

  void _getAllRockets(
      GetAllRocketsEvent event, Emitter<RocketsState> emit) async {
    emit(GetRocketsLoading());
    var result = await rocketRepo.getAllRockets();

    result.fold((failure) {
      emit(GetRocketsFailure(errorMessage: failure.message));
    }, (allRockets) {
      emit(GetRocketsSuccess(rockets: allRockets));
    });
  }
}
