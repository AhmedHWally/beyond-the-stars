import 'package:beyond_the_stars/core/widgets/custom_auth_field.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
          child: Column(
        children: [
          CustomAuthField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'value empty';
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'value empty';
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'value empty';
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
