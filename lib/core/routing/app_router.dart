import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/core/widgets/custom_page_sliding_animation.dart';
import 'package:beyond_the_stars/features/login/ui/login_screen.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:beyond_the_stars/features/register/register_screen.dart';
import 'package:beyond_the_stars/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.register:
        return CustomPageSlidingAnimation(child: const RegisterScreen());
    }
    return null;
  }
}
