import 'package:beyond_the_stars/features/register/data/models/user_model.dart';
import 'package:beyond_the_stars/features/register/data/repos/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_user_to_fire_store_event.dart';
part 'add_user_to_fire_store_state.dart';

class AddUserToFireStoreBloc
    extends Bloc<AddUserToFireStoreEvent, AddUserToFireStoreState> {
  AddUserToFireStoreBloc(this.registerRepo)
      : super(AddUserToFireStoreInitial()) {
    on<AddUserToFireStoreEvent>(_addUserToFireStore);
  }
  final RegisterRepo registerRepo;
  Future<void> _addUserToFireStore(AddUserToFireStoreEvent event,
      Emitter<AddUserToFireStoreState> emit) async {
    emit(AddUserLoading());
    final result = await registerRepo.addUserToFireStore(event.userModel);
    result.fold(
      (failure) => emit(AddUserFailure(errorMessage: failure.message)),
      (unit) => emit(AddUserSuccess()),
    );
  }
}
