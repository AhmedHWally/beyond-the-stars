import 'package:beyond_the_stars/core/widgets/custom_auth_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          child: Column(
        children: [
          CustomAuthField(
            hint: 'UserName',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.person,
          ),
          SizedBox(
            height: 24,
          ),
          CustomAuthField(
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
