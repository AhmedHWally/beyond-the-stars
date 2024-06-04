import 'package:beyond_the_stars/features/register/data/models/register_new_account_model.dart';
import 'package:beyond_the_stars/features/register/data/models/user_model.dart';
import 'package:beyond_the_stars/features/register/data/repos/register_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this.registerRepo) : super(RegisterInitial()) {
    on<RegisterAccountEvent>(_registerNewAccount);
  }
  final RegisterRepo registerRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _registerNewAccount(
      RegisterAccountEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final response = await registerRepo.register(
      RegisterNewAccountModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(RegisterFailure(errorMessage: failure.message)),
      (userModel) => emit(RegisterSuccess(userModel: userModel)),
    );
  }
}
