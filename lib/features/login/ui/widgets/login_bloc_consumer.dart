import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';
import 'package:beyond_the_stars/core/helpers/cache_helper.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/core/widgets/auth_button.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          AppStrings.userId = state.id;
          CacheHelper.set(key: 'userId', value: state.id);
          showToast(text: 'Login done successfully');
          Navigator.of(context)
              .pushNamedAndRemoveUntil(Routes.layout, (route) => false);
        } else if (state is LoginFailure) {
          showToast(text: state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return AuthButton(
            isLoading: true,
            title: 'Login',
            onPressed: () {},
          );
        } else {
          return AuthButton(
            title: 'Login',
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              if (context.read<LoginBloc>().formKey.currentState!.validate()) {
                print(context.read<LoginBloc>().emailController.text);
                print(context.read<LoginBloc>().passwordController.text);
                context.read<LoginBloc>().add(LoginAccountEvent());
              }
            },
          );
        }
      },
    );
  }
}
