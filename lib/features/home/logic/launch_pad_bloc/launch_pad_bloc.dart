import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/data/repos/launch_pad_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'launch_pad_event.dart';
part 'launch_pad_state.dart';

class LaunchPadBloc extends Bloc<LaunchPadEvent, LaunchPadState> {
  LaunchPadBloc(this.launchPadRepo) : super(LaunchPadInitial()) {
    on<GetLaunchPadsEvent>(_getLaunchPads);
  }
  final LaunchPadRepo launchPadRepo;

  void _getLaunchPads(
      GetLaunchPadsEvent event, Emitter<LaunchPadState> emit) async {
    emit(GetLaunchPadsLoading());
    var result = await launchPadRepo.getAllLaunchPads();
    result.fold((failure) {
      emit(GetLaunchPadsFailure(errorMessage: failure.message));
    }, (allLaunchPads) {
      emit(GetLaunchPadsSuccess(launchpads: allLaunchPads));
    });
  }
}
