import 'package:beyond_the_stars/core/dependency_injection/dependency_injection.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:beyond_the_stars/core/widgets/custom_page_sliding_animation.dart';
import 'package:beyond_the_stars/features/company_info/logic/company_info_bloc/company_info_bloc.dart';
import 'package:beyond_the_stars/features/company_info/ui/company_info_screen.dart';
import 'package:beyond_the_stars/features/crew/data/models/crew_model.dart';
import 'package:beyond_the_stars/features/crew/logic/crew_bloc/crew_bloc.dart';
import 'package:beyond_the_stars/features/crew/ui/crew_details_screen.dart';
import 'package:beyond_the_stars/features/crew/ui/crew_screen.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/logic/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';
import 'package:beyond_the_stars/features/home/logic/launch_pad_bloc/launch_pad_bloc.dart';
import 'package:beyond_the_stars/features/home/logic/rockets_bloc/rockets_bloc.dart';
import 'package:beyond_the_stars/features/home/ui/screens/launchpad_details_screen.dart';
import 'package:beyond_the_stars/features/home/ui/screens/rocket_details_screen.dart';
import 'package:beyond_the_stars/features/layout/ui/layout_screen.dart';
import 'package:beyond_the_stars/features/login/logic/login_bloc/login_bloc.dart';
import 'package:beyond_the_stars/features/login/ui/login_screen.dart';
import 'package:beyond_the_stars/features/onBoarding/ui/on_boarding_screen.dart';
import 'package:beyond_the_stars/features/profile/data/models/profile_model.dart';
import 'package:beyond_the_stars/features/profile/logic/profile_bloc/profile_bloc.dart';
import 'package:beyond_the_stars/features/edit_profile/ui/edit_profile_screen.dart';
import 'package:beyond_the_stars/features/register/logic/add_user_to_firestore_bloc.dart/add_user_to_fire_store_bloc.dart';
import 'package:beyond_the_stars/features/register/logic/register_bloc/register_bloc.dart';
import 'package:beyond_the_stars/features/register/ui/register_screen.dart';
import 'package:beyond_the_stars/features/ships/data/models/ships_model.dart';
import 'package:beyond_the_stars/features/ships/ui/ship_details_screen.dart';
import 'package:beyond_the_stars/features/ships/ui/ships_screen.dart';
import 'package:beyond_the_stars/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

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
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) =>
                          getIt.get<RocketsBloc>()..add(GetAllRocketsEvent())),
                  BlocProvider(
                      create: (context) =>
                          getIt.get<LaunchPadBloc>()..add(GetLaunchPadsEvent()))
                ], child: const LayoutScreen()));

      case Routes.rocketDetails:
        final rocketData = settings.arguments as RocketModel;
        return MaterialPageRoute(
            builder: (context) => RocketDetailsScreen(
                  rocket: rocketData,
                ));
      case Routes.launchPadDetails:
        final launcpadData = settings.arguments as LaunchPadModel;
        return MaterialPageRoute(
            builder: (context) => LaunchpadDetailsScreen(
                  launchPad: launcpadData,
                ));

      case Routes.editProfileScreen:
        final profile = settings.arguments as ProfileModel;
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) =>
                            getIt.get<UploadProfileImageBloc>()),
                    BlocProvider(
                        create: (context) => getIt.get<EditProfileBloc>())
                  ],
                  child: EditProfileScreen(
                    profile: profile,
                  ),
                ));

      case Routes.ships:
        return MaterialPageRoute(builder: (context) => const ShipsScreen());

      case Routes.shipDetails:
        final ShipsModel shipDetails = settings.arguments as ShipsModel;
        return MaterialPageRoute(
            builder: (context) => ShipDetailsScreen(
                  ship: shipDetails,
                ));

      case Routes.crewScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt.get<CrewBloc>()..add(LoadCrew()),
                  child: const CrewScreen(),
                ));
      case Routes.crewDetailsScreen:
        final crewData = settings.arguments as CrewModel;
        return MaterialPageRoute(
            builder: (context) => CrewDetailsScreen(crewPerson: crewData));

      case Routes.companyInfo:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      getIt.get<CompanyInfoBloc>()..add(LoadCompanyInfo()),
                  child: const CompanyInfoScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text(" Route does Not Exist"),
            ),
          ),
        );
    }
  }
}
