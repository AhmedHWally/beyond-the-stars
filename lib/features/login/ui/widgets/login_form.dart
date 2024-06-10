import 'package:beyond_the_stars/core/utils/app_regex.dart';
import 'package:beyond_the_stars/core/widgets/custom_auth_field.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          key: context.read<LoginBloc>().formKey,
          child: Column(
            children: [
              CustomAuthField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty';
                  } else if (!AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
                controller: context.read<LoginBloc>().emailController,
                hint: 'Email Address',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomAuthField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password must not be empty';
                  } else {
                    return null;
                  }
                },
                controller: context.read<LoginBloc>().passwordController,
                hint: 'Password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                icon: Icons.remove_red_eye,
                isSecureNeeded: true,
              ),
            ],
          )),
    );
  }
}
