import 'package:flutter/material.dart';
import 'package:template_app/app_settings/theme_settings.dart';

class InputTheme {
  static InputDecorationTheme inputDecorationTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return InputDecorationTheme(
      hintStyle: TextStyle(
        color: brightness == Brightness.light
            ? ThemeSettings.primaryTextColor.lightModePrimary
            : ThemeSettings.primaryTextColor.darkModePrimary,
      ),
      labelStyle: TextStyle(
        color: brightness == Brightness.light
            ? ThemeSettings.primaryTextColor.lightModePrimary
            : ThemeSettings.primaryTextColor.darkModePrimary,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: ThemeSettings.inputsBorderRadius,
        borderSide: BorderSide(
          color: brightness == Brightness.light
              ? ThemeSettings.primaryTextColor.lightModePrimary
              : ThemeSettings.primaryTextColor.darkModePrimary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: ThemeSettings.inputsBorderRadius,
        borderSide: BorderSide(
          color: brightness == Brightness.light
              ? ThemeSettings.primaryTextColor.lightModePrimary
              : ThemeSettings.primaryTextColor.darkModePrimary,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: ThemeSettings.inputsBorderRadius,
        borderSide: BorderSide(color: ThemeSettings.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: ThemeSettings.inputsBorderRadius,
        borderSide: BorderSide(
          color: brightness == Brightness.light
              ? ThemeSettings.primaryTextColor.lightModePrimary
              : ThemeSettings.primaryTextColor.darkModePrimary,
        ),
      ),
    );
  }
}
