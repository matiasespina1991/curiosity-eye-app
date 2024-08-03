import 'package:flutter/material.dart';
import '../../app_settings/theme_settings.dart';

class ChipDecorationTheme {
  static ChipThemeData chipTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return const ChipThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: ThemeSettings.chipBorderRadius,
      ),
    );
  }
}
