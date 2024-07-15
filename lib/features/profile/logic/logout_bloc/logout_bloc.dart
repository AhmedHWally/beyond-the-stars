import 'package:beyond_the_stars/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(this.profileRepo) : super(LogoutInitial()) {
    on<LogoutUserEvent>(_logoutUser);
  }
  final ProfileRepo profileRepo;
  _logoutUser(LogoutUserEvent event, Emitter<LogoutState> emit) async {
    var result = await profileRepo.logout();
    result.fold((failure) => emit(LogoutFailure(errMessage: failure.message)),
        (unit) => emit(LogoutSuccess()));
  }
}
