import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static  SharedPreferences? sharedPreferences;

  static init() async {
     sharedPreferences = await SharedPreferences.getInstance();
  }

  static setData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences!.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences!.setStringList(key, value);
    }
  }

  static getData({required String key}) {
   return sharedPreferences!.get(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences!.clear();
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  static bool containsKeyData({required String key}) {
    return sharedPreferences!.containsKey(key);
  }
}