import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:beyond_the_stars/features/crew/data/repos/crew_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'crew_event.dart';
part 'crew_state.dart';

class CrewBloc extends Bloc<CrewEvent, CrewState> {
  CrewBloc(this.crewRepo) : super(CrewInitial()) {
    on<LoadCrew>(_loadCrew);
  }
  final CrewRepo crewRepo;

  _loadCrew(LoadCrew event, Emitter<CrewState> emit) async {
    emit(LoadCrewLoading());
    var result = await crewRepo.getCrew();
    result.fold(
        (failure) => emit(LoadCrewFailure(errorMessage: failure.message)),
        (crew) => emit(LoadCrewSuccess(crew: crew)));
  }
}
