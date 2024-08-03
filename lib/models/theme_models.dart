import 'dart:ui';

class FontConfig {
  final String name;
  final bool isGoogleFont;
  final double? fontSize;

  const FontConfig({
    this.fontSize,
    required this.name,
    required this.isGoogleFont,
  });
}

class TextThemes {
  final FontConfig primaryFont;
  final FontConfig secondaryFont;
  final FontConfig tertiaryFont;

  const TextThemes({
    required this.primaryFont,
    required this.secondaryFont,
    required this.tertiaryFont,
  });
}

class ThemeColors {
  final Color lightModePrimary;
  final Color darkModePrimary;
  final Color? lightModeSecondary;
  final Color? darkModeSecondary;
  final Color? lightModeTertiary;
  final Color? darkModeTertiary;

  const ThemeColors({
    required this.lightModePrimary,
    required this.darkModePrimary,
    this.lightModeSecondary,
    this.darkModeSecondary,
    this.lightModeTertiary,
    this.darkModeTertiary,
  });
}

class ThemeConfig {
  final bool forceSeedColor;
  final Color seedColor;

  const ThemeConfig({
    required this.forceSeedColor,
    required this.seedColor,
  });
}
