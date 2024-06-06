import 'package:beyond_the_stars/core/utils/app_regex.dart';
import 'package:beyond_the_stars/core/widgets/custom_auth_field.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          key: context.read<RegisterBloc>().formKey,
          child: Column(
            children: [
              CustomAuthField(
                controller: context.read<RegisterBloc>().nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name must not be empty';
                  } else {
                    return null;
                  }
                },
                hint: 'UserName',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.person_outline,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomAuthField(
                controller: context.read<RegisterBloc>().emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email must not be empty';
                  } else if (!AppRegex.isEmailValid(value)) {
                    return 'Please enter a valid email';
                  } else {
                    return null;
                  }
                },
                hint: 'Email Address',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomAuthField(
                controller: context.read<RegisterBloc>().passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password must not be empty';
                  } else if (!AppRegex.isPasswordValid(value)) {
                    return 'password must be at least 7 characters long and contain (1 lowercase letter, 1 uppercase letter, 1 number)';
                  } else {
                    return null;
                  }
                },
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
