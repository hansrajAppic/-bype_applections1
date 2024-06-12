import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static SharedPreferences? prefs;

  static Future<SharedPreferences?> getInstance() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static setValue(String key, String value) async {
    (await getInstance())!.setString(key, value);
  }

  static getValue(String key ) async {
    return (await getInstance())!.getString(key);
  }

  static setBool(String key, bool value) async {
    (await getInstance())!.setBool(key, value);
  }

  static getBool(String key) async {
    return (await getInstance())!.getBool(key);
  }

  static deleteValue(String key) async {
    (await getInstance())!.remove(key);
  }

  static clear() async {
    (await getInstance())!.clear();
  }
}











