import 'package:todo_app/core/services/preference_provider.dart';

class ThemeServices {
  static final String darkTheme = 'dark';
  static final String lightTheme = 'light';
  static final String themePreferenceKey = 'app_theme';

  static setCurrentTheme(String theme) async {
    await PreferenceProvider.setPreferenceValue(themePreferenceKey, theme);
  }

  static Future<String> getCurrentTheme() async {
    return await PreferenceProvider.getPreferenceValue(themePreferenceKey) ??
        darkTheme;
  }
}
