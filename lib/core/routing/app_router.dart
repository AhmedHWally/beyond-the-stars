import 'package:beyond_the_stars/core/dependency_injection/dependency_injection.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/core/widgets/custom_page_sliding_animation.dart';
import 'package:beyond_the_stars/features/layout/layout_screen.dart';
import 'package:beyond_the_stars/features/login/data/repo/login_repo.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:beyond_the_stars/features/login/ui/login_screen.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:beyond_the_stars/features/register/logic/add_user_to_firestore_bloc.dart/add_user_to_fire_store_bloc.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:beyond_the_stars/features/register/ui/register_screen.dart';
import 'package:beyond_the_stars/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          builder: (context) => BlocProvider(
              create: (context) => getIt.get<LoginBloc>(),
              child: const LoginScreen()),
        );
      case Routes.register:
        return CustomPageSlidingAnimation(
            child: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => getIt.get<RegisterBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<AddUserToFireStoreBloc>(),
          ),
        ], child: const RegisterScreen()));
      case Routes.layout:
        return MaterialPageRoute(builder: (context) => const LayoutScreen());
    }
    return null;
  }
}
