import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  ///
  /// 0: LIGHT
  /// 1: DARK
  /// 2: ORANGE
  ///

  static const String prefName = "app_theme";

  static Future<void> saveTheme(int themeIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(prefName, themeIndex);
  }

  static Future<int> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(prefName) ?? 0;
  }
}
