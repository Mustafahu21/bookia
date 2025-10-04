import 'dart:convert';

import 'package:bookia/features/auth/data/model/response/auth_response/data.dart';
import 'package:bookia/features/wishlist/data/model/wishlist_response/datum.dart';
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

  static UserData? getUserData() {
    var userDataString = pref.getString(kUserData);
    if (userDataString == null) return null;
    var objectJson = json.decode(userDataString);
    return UserData.fromJson(objectJson);
  }

  static setWishlistbool(bool isWishlist) {
    setData('isWishlist', isWishlist);
  }

  static List<Datum>? getWishlist() {
    var source = pref.getStringList("wishlist");
    if (source == null) return null;
    var listOfObj = source.map((e) => Datum.fromJson(jsonDecode(e))).toList();
    return listOfObj;
  }

  static setWishlist(List<Datum>? books) async {
    if (books == null) return;

    var listOfString = books.map((e) => jsonEncode(e.toJson())).toList();
    await pref.setStringList("wishlist", listOfString);
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
}
