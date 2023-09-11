// ignore_for_file: camel_case_types, body_might_complete_normally_nullable
import 'package:shared_preferences/shared_preferences.dart';

class cache_helper {
  static late SharedPreferences sharedPreferences; //declare

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance(); //assignment
  }

  //save to shred preferences
  static Future<bool> addBoolToSF(
      {required String key, required bool isdark}) async {
    sharedPreferences.setBool(key, isdark);
    return true;
  }

//get from shared preferences
  static bool? getBoolFromSF({required String key}) {
    return sharedPreferences.getBool(key);
    //print( prefs.getBool(key));
  }

  //shredPreferences of shop app
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
