import 'package:beyond_the_stars/core/routing/app_router.dart';
import 'package:beyond_the_stars/core/routing/routes.dart';
import 'package:flutter/material.dart';

class BeyondTheStarsApp extends StatelessWidget {
  const BeyondTheStarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'SpaceMono',
        scaffoldBackgroundColor: const Color(0xff424F66),
      ),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
