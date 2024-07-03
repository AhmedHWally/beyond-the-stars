import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  CacheHelper._();

  static Future<void> set({required String key, required dynamic value}) async {
    if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else {
      await _preferences.setString(key, value);
    }
  }

  static dynamic get({required String key}) {
    return _preferences.get(key);
  }

  static Future<bool> remove({required String key}) async {
    return await _preferences.remove(key);
  }

  static Future<void> update(
      {required String key, required dynamic value}) async {
    await _preferences.remove(key);
    await set(key: key, value: value);
  }

  static Future<bool> clear() async {
    return await _preferences.clear();
  }
}
