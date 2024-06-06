import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:beyond_the_stars/core/constants/strings.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _splashController;
  @override
  void initState() {
    _splashController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: AspectRatio(
            aspectRatio: 1,
            child: LottieBuilder.asset(
              'assets/splash/splashSpace.json',
              controller: _splashController,
              onLoaded: (complete) {
                _splashController.duration = complete.duration * 0.9;
                _splashController.forward().whenComplete(() {
                  AppStrings.isOnBoardingDone == true
                      ? AppStrings.userId == ''
                          ? Navigator.of(context)
                              .pushReplacementNamed(Routes.login)
                          : Navigator.of(context)
                              .pushReplacementNamed(Routes.layout)
                      : Navigator.of(context)
                          .pushReplacementNamed(Routes.onboarding);
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                WavyAnimatedText('Beyond The Stars',
                    speed: const Duration(milliseconds: 280),
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
