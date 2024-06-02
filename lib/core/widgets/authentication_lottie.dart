import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthenticationLottie extends StatelessWidget {
  const AuthenticationLottie({super.key, required this.lottie});
  final String lottie;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.35,
        width: MediaQuery.sizeOf(context).width,
        child: LottieBuilder.asset(
          lottie,
        ));
  }
}
