import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePrefs {
  static String theme_status = 'ThemeStatus';
  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(theme_status, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(theme_status) ?? false ;
  }
}
