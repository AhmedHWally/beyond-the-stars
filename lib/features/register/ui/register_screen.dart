import 'dart:developer';

import 'package:beyond_the_stars/core/constants/images.dart';
import 'package:beyond_the_stars/core/constants/text_styles.dart';
import 'package:beyond_the_stars/core/widgets/auth_switch_row.dart';
import 'package:beyond_the_stars/core/widgets/authentication_lottie.dart';
import 'package:beyond_the_stars/features/register/ui/widgets/register_bloc_consumer.dart';
import 'package:beyond_the_stars/features/register/ui/widgets/register_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    log(FirebaseAuth.instance.currentUser.toString());
    super.initState();
  }

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
                const AuthenticationLottie(lottie: AppImages.registerLottie),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: FittedBox(
                    child: Text(
                      'Let\'s launch',
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
                const RegisterForm(),
                const SizedBox(
                  height: 24,
                ),
                const RegisterBlocConsumer(),
                const SizedBox(height: 16),
                AuthSwitchRow(
                  description: 'Already Have an account?',
                  title: 'Login Now',
                  onPressed: () {
                    Navigator.of(context).pop();
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
