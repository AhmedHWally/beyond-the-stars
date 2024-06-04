import 'package:beyond_the_stars/features/login/data/models/login_request_model.dart';
import 'package:beyond_the_stars/features/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<LoginAccountEvent>(_loginAccount);
  }

  final LoginRepo loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void _loginAccount(LoginAccountEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final response = await loginRepo.login(
      LoginRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.message)),
      (userCredential) => emit(LoginSuccess(id: userCredential.user!.uid)),
    );
  }
}
