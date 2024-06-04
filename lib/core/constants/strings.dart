import 'package:beyond_the_stars/core/helpers/cache_helper.dart';

class AppStrings {
  static bool isOnBoardingDone =
      CacheHelper.get(key: 'isOnBoardingDone') ?? false;

  static String userId = CacheHelper.get(key: 'userId');
}
