import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/functions/show_toast.dart';

import 'package:beyond_the_stars/core/routing/routes.dart';

import 'package:beyond_the_stars/core/widgets/auth_switch_row.dart';
import 'package:beyond_the_stars/core/widgets/authentication_lottie.dart';
import 'package:beyond_the_stars/features/login/ui/widgets/login_bloc_consumer.dart';

import 'package:beyond_the_stars/features/login/ui/widgets/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppImages.authBackGround,
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
                const LoginBlocConsumer(),
                const SizedBox(height: 16),
                AuthSwitchRow(
                  description: 'Don\'t Have an account?',
                  title: 'Register Now',
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Navigator.of(context).pushNamed(Routes.register);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("get verification code?"),
                    TextButton(
                        onPressed: () async {
                          if (FirebaseAuth
                                      .instance.currentUser?.emailVerified !=
                                  true &&
                              AppStrings.userId != '') {
                            showToast(text: 'verification message sent');
                            await FirebaseAuth.instance.currentUser
                                ?.sendEmailVerification();
                          } else {
                            showToast(
                                text: 'log in so we can identify ur email ');
                          }
                        },
                        child: const Text('send now'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
