import 'package:beyond_the_stars/beyond_the_stars_app.dart';
import 'package:beyond_the_stars/core/helpers/cache_helper.dart';
import 'package:beyond_the_stars/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  runApp(DevicePreview(
      enabled: false, builder: (context) => const BeyondTheStarsApp()));
}
