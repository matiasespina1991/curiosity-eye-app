import 'package:flutter/material.dart';
import 'package:template_app/app_settings/theme_settings.dart';

class ButtonsTheme {
  static ElevatedButtonThemeData elevatedButtonTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ThemeSettings.forceSeedColor
            ? colorScheme.onPrimary
            : (brightness == Brightness.light
                ? ThemeSettings.elevatedButtonTextColor.lightModePrimary
                : ThemeSettings.elevatedButtonTextColor.darkModePrimary),
        backgroundColor: ThemeSettings.forceSeedColor
            ? colorScheme.primary.withOpacity(ThemeSettings.buttonsOpacity)
            : (brightness == Brightness.light
                    ? ThemeSettings
                        .elevatedButtonBackgroundColor.lightModePrimary
                    : ThemeSettings
                        .elevatedButtonBackgroundColor.darkModePrimary)
                .withOpacity(ThemeSettings.buttonsOpacity),
        elevation: ThemeSettings.buttonsElevation,
        minimumSize: const Size(double.maxFinite, ThemeSettings.buttonsHeight),
        shape: const RoundedRectangleBorder(
            borderRadius: ThemeSettings.buttonsBorderRadius),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: ThemeSettings.forceSeedColor
            ? colorScheme.primary
            : (brightness == Brightness.light
                ? ThemeSettings.outlinedButtonTextColor.lightModePrimary
                : ThemeSettings.outlinedButtonTextColor.darkModePrimary),
        backgroundColor: Colors.transparent,
        minimumSize:
            const Size(double.minPositive, ThemeSettings.buttonsHeight),
        side: BorderSide(
          color: ThemeSettings.forceSeedColor
              ? colorScheme.primary
              : (brightness == Brightness.light
                  ? ThemeSettings.outlinedButtonTextColor.lightModePrimary
                  : ThemeSettings.outlinedButtonTextColor.darkModePrimary),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: ThemeSettings.buttonsBorderRadius),
      ),
    );
  }

  static TextButtonThemeData textButtonTheme(
      Brightness brightness, ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ThemeSettings.forceSeedColor
            ? colorScheme.primary
            : (brightness == Brightness.light
                ? ThemeSettings.textButtonTextColor.lightModePrimary
                : ThemeSettings.textButtonTextColor.darkModePrimary),
        minimumSize:
            const Size(double.minPositive, ThemeSettings.buttonsHeight),
        shape: const RoundedRectangleBorder(
            borderRadius: ThemeSettings.buttonsBorderRadius),
      ),
    );
  }
}
