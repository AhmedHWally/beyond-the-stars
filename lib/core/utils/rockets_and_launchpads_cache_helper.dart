import 'dart:convert';

import 'package:beyond_the_stars/core/helpers/cache_helper.dart';
import 'package:beyond_the_stars/features/home/data/models/launch_pad_model/launch_pad_model.dart';
import 'package:beyond_the_stars/features/home/data/models/rocket_model/rocket_model.dart';

class RocketsAndLaunchpadsCacheHelper {
  static cacheRocketsData(List<RocketModel> rockets) async {
    String encodeJsonData = json.encode(
      rockets
          .map(
            (rockets) => rockets.toJson(),
          )
          .toList(),
    );
    await CacheHelper.set(
      key: 'cachedRockets',
      value: encodeJsonData,
    );
  }

  static List<RocketModel> getCachedRocketsData() {
    final cachedRockets = CacheHelper.get(key: 'cachedRockets') ?? '';
    List<RocketModel> rockets = [];
    if (cachedRockets.isNotEmpty) {
      List decodeJsonData = json.decode(cachedRockets);
      rockets = decodeJsonData
          .map(
            (jsonRockets) => RocketModel.fromJson(jsonRockets),
          )
          .toList();
    }
    return rockets;
  }

  static cacheLaunchPadData(List<LaunchPadModel> launchPads) async {
    String encodeJsonData = json.encode(
      launchPads
          .map(
            (launchPads) => launchPads.toJson(),
          )
          .toList(),
    );
    await CacheHelper.set(
      key: 'cachedLaunchPads',
      value: encodeJsonData,
    );
  }

  static List<LaunchPadModel> getCachedLaunchPadData() {
    final cachedLaunchPads = CacheHelper.get(key: 'cachedLaunchPads') ?? '';
    List<LaunchPadModel> launchPads = [];
    if (cachedLaunchPads.isNotEmpty) {
      List decodeJsonData = json.decode(cachedLaunchPads);
      launchPads = decodeJsonData
          .map(
            (jsonLaunchPads) => LaunchPadModel.fromJson(jsonLaunchPads),
          )
          .toList();
    }
    return launchPads;
  }

  // static cacheProfileData(UserModel userModel) async {
  //   String encodeJsonData = json.encode(userModel.toMap());
  //   await MySharedPreferences.setString(
  //     'cachedProfileData',
  //     encodeJsonData,
  //   );
  // }

  // static Future<UserModel?> getCachedProfileData() async {
  //   final cachedPosts = MySharedPreferences.getString('cachedProfileData');
  //   UserModel? userModel;
  //   if (cachedPosts.isNotEmpty) {
  //     Map<String, dynamic> decodeJsonData = json.decode(cachedPosts);
  //     userModel = UserModel.fromJson(decodeJsonData);
  //   }
  //   return userModel;
  // }
}
