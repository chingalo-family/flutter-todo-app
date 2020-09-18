import 'package:flutter/foundation.dart';
import 'package:todo_app/core/services/preference_provider.dart';

class AppThemeState with ChangeNotifier {
  String _currentTheme;

  String get currentTheme => _currentTheme ?? PreferenceProvider.darkTheme;

  void setCurrentTheme(String theme) async {
    _currentTheme = theme;
    await PreferenceProvider.setCurrentTheme(theme);
    notifyListeners();
  }
}
