import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/functions/build_shadow.dart';
import 'package:beyond_the_stars/core/widgets/auth_button.dart';
import 'package:beyond_the_stars/core/widgets/auth_switch_row.dart';
import 'package:beyond_the_stars/core/widgets/authentication_lottie.dart';
import 'package:beyond_the_stars/core/widgets/custom_auth_field.dart';
import 'package:beyond_the_stars/features/login/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/authBackGround.jpeg',
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AuthenticationLottie(lottie: AppImages.loginLottie),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FittedBox(
                    child: Text(
                      'Welcome Back',
                      style: AppTextStyles.style28Bold.copyWith(shadows: [
                        const Shadow(
                            color: Color(0xff0E47A1),
                            offset: Offset(2, 2),
                            blurRadius: 1)
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoginForm(),
                const SizedBox(
                  height: 24,
                ),
                AuthButton(
                  title: 'Login',
                  onPressed: () {
                    log('message');
                  },
                ),
                const SizedBox(height: 16),
                AuthSwitchRow(
                  description: 'Don\'t Have an account?',
                  title: 'Register Now',
                  onPressed: () {
                    log('hi');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
