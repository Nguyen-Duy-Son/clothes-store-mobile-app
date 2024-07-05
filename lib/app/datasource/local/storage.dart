import 'package:shared_preferences/shared_preferences.dart';
class Storage{
  static Future<void> setToken(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static Future<String?> getToken(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<void> setPhone(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
  static Future<String?> getPhone(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  static Future<void> setIsFirstTime(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }
  static Future<String?> getIsFirstTime(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}