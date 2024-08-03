import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template_app/app_settings/theme_settings.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) async {
    if (ThemeSettings.forceDefaultThemeMode) {
      debugPrint(
          'Error: Theme mode change forbidden. Forced theme is on. Disable it from ThemeSettings.forceDefaultThemeMode in order to proceed with theme change.');
      return;
    }

    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    String userDefinedTheme = isDarkMode ? 'dark' : 'light';
    await _storage.write(
        key: 'user_defined_theme_mode', value: userDefinedTheme);
  }

  void _loadThemeMode() async {
    if (ThemeSettings.forceDefaultThemeMode) {
      _themeMode = ThemeSettings.defaultThemeMode == 'dark'
          ? ThemeMode.dark
          : ThemeMode.light;
      notifyListeners();
      return;
    }

    String? userDefinedTheme =
        await _storage.read(key: 'user_defined_theme_mode');

    if (userDefinedTheme != null) {
      bool isDarkMode = userDefinedTheme == 'dark';
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }
}
