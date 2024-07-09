import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/storage_constants.dart';
class Storage{
  static Future<void> setToken(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(StorageConstants.token, value);
  }
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageConstants.token);
  }
  static Future<void> setPhone(String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(StorageConstants.phone, value);
  }
  static Future<String?> getPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(StorageConstants.phone);
  }
  static Future<void> setIsFirstTime(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(StorageConstants.isFirstTime, value);
  }
  static Future<bool?> getIsFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(StorageConstants.isFirstTime);
  }
}