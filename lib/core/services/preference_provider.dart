import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider {
  static final String darkTheme = 'dark';
  static final String lightTheme = 'light';
  static final String themePreferenceKey = 'app_theme';

  static setCurrentTheme(String theme) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(themePreferenceKey, theme);
  }

  static Future<String> getCurrentTheme() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(themePreferenceKey) ?? darkTheme;
  }
}
