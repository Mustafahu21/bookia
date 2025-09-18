import 'dart:convert';

import 'package:bookia/features/auth/data/model/response/auth_response/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences pref;
  static const String kUserData = 'user_data';

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static setUserData(UserData? userData) {
    if (userData == null) return;
    var objectJson = userData.toJson();
    var userDataString = json.encode(objectJson);
    setData(kUserData, userDataString);
  }

  static Future<UserData?> getUserData() async {
    var userDataString = pref.getString(kUserData);
    if (userDataString == null) return null;
    var objectJson = json.decode(userDataString);
    return UserData.fromJson(objectJson);
  }

  static setData(String key, dynamic value) async {
    if (value is String) {
      return await pref.setString(key, value);
    } else if (value is int) {
      return await pref.setInt(key, value);
    } else if (value is bool) {
      return await pref.setBool(key, value);
    } else if (value is double) {
      return await pref.setDouble(key, value);
    } else if (value is List<String>) {
      return await pref.setStringList(key, value);
    }
  }

  static getData(String key) {
    return pref.get(key);
  }

  // static String? getString(String key) {
  //   return pref.getString(key);
  // }

  // static Future<bool> setString(String key, String value) {
  //   return pref.setString(key, value);
  // }

  // static Future<bool> remove(String key) {
  //   return pref.remove(key);
  // }

  // static Future<bool> clear() {
  //   return pref.clear();
  // }

  // static Future<bool> setInt(String key, int value) {
  //   return pref.setInt(key, value);
  // }

  // static int? getInt(String key) {
  //   return pref.getInt(key);
  // }

  // static Future<bool> setDouble(String key, double value) {
  //   return pref.setDouble(key, value);
  // }

  // static double? getDouble(String key) {
  //   return pref.getDouble(key);
  // }

  // static bool? getBool(String key) {
  //   return pref.getBool(key);
  // }

  // static Future<bool> setBool(String key, bool value) {
  //   return pref.setBool(key, value);
  // }

  // static Future<bool> setStringList(String key, List<String> value) {
  //   return pref.setStringList(key, value);
  // }

  // static List<String>? getStringList(String key) {
  //   return pref.getStringList(key);
  // }
}
