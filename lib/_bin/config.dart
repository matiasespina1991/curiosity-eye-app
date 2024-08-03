// import 'package:flutter/material.dart';
//
// import 'models/general_models.dart';
// import 'models/theme_models.dart';
//
// class Config {
//   // APP INFO:
//   static const String appName = 'Template App';
//
//   // APP CONFIG:
//   static const bool useSafeArea =
//       false; // If true, the app will adjust to the space below the status bar
//   static const bool useTopAppBar = false;
//   static const bool useFloatingSpeedDialMenu = true;
//   static const bool useAppDrawer = false;
//
//   // DEBUG MODE:
//   static const bool debugMode = false; // Set to true to skip login screen
//   static const debugScreen =
//       '/home'; // Set to the screen you want to navigate to in debug mode
//
//   // AUTH:
//   static const bool useProtectedRoutes =
//       true; // If true, the app will always redirect to login screen if user is not authenticated
//   static const bool useFirebase = false;
//   static const bool allowGoogleSignIn = false;
//   static const List<String> googleSignInScopes = [
//     'email'
//   ]; // 'email', 'profile', 'openid', etc
//   static const bool allowFacebookSignIn = false;
//   static const bool allowAppleSignIn = false;
//   static const bool allowAnonymousSignIn = false;
//   static const bool allowEmailSignIn = false;
//
//   static const String appDefaultLanguage = 'es';
//   static const bool forceDefaultLanguage = false;
//   static const List<String> supportedLocales = ['en', 'es', 'de'];
//
//   /// NOTE: edit lib/l10n/intl_xx.arb files and use 'flutter pub run intl_utils:generate' to generate translations
//
//   // APP STYLES:
//
//   static const String defaultThemeMode = 'light'; // 'light' | 'dark'
//   static const bool forceDefaultThemeMode = false;
//   static const String defaultScrollPhysics =
//       'always'; // 'never', 'always', 'clamp'
//   static const bool useFlutterToast =
//       false; // Use FlutterToast package for snackbars
//   static const bool useMaterial3 = true; // Use Material 3.0 // DEFAULT: true
//
//   static const LottieAnimationBackground
//       loginScreenLottieBackgroundAnimationLightMode = LottieAnimationBackground(
//     animationPath: 'lib/assets/animation9.json',
//     // animationPath: 'lib/assets/animation7.json',
//     // animationPath: 'lib/assets/animation4.json', // dark mode
//     width: 200,
//     x: 0,
//     y: 0,
//     blur: 80,
//     active: false,
//     opacity: 0.8,
//   );
//
//   static const LottieAnimationBackground
//       loginScreenLottieBackgroundAnimationDarkMode = LottieAnimationBackground(
//     animationPath: 'lib/assets/animation4.json',
//     // animationPath: 'lib/assets/animation7.json',
//     // animationPath: 'lib/assets/animation4.json', // dark mode
//     width: 200,
//     x: 0,
//     y: 250,
//     // y: 0,
//     blur: 80,
//     active: false,
//     opacity: 0.8,
//   );
//
//   static const double buttonsOpacity = 0.8;
//   static const bool glassTextInputs = false;
//   static const String textInputBorderStyle = 'border'; // 'border' / 'no-border'
//
//   // COLOR THEME:
//
//   ///TODO
//   //ThemePalette for dark and light themes, presenting the primary, secondary, tertiary, quarternary, white, and black, inverse, success, info, warning, and error colors.
//
//   // static const ThemePallette themePallette = ThemePallette(
//   //   primary: Color(0xFF6200EE),
//   //   secondary: Color(0xFF03DAC6),
//   //   tertiary: Color(0xFF03DAC6),
//   //   quarternary: Color(0xFF03DAC6),
//   //   white: Color(0xFFFFFFFF),
//   //   black: Color(0xFF000000),
//   //   inverse: Color(0xFF000000),
//   //   success: Color(0xFF00C853),
//   //   info: Color(0xFF03DAC6),
//   //   warning: Color(0xFFFFAB00),
//   //   error: Color(0xFFFF453A),
//   // );
//
//   /// Theme Seed Color
//   static const ThemeConfig themeSeedColor = ThemeConfig(
//     forceSeedColor: true, // Set to true to use the seed color
//     seedColor: Colors.yellow,
//   );
//
//   /// NOTE: If seed color is forced, then all the values below will be ignored
//   static const ThemeColors scaffoldBackgroundColor = ThemeColors(
//     lightModePrimary: lightWhiteColor,
//     darkModePrimary: lightBlackColor,
//   );
//
//   static const ThemeColors appBarBackgroundColor = ThemeColors(
//     lightModePrimary: Colors.black87,
//     darkModePrimary: Colors.blueGrey,
//   );
//
//   static const ThemeColors primaryTextColor = ThemeColors(
//     lightModePrimary: Colors.black,
//     darkModePrimary: Colors.white,
//   );
//
//   static const ThemeColors secondaryTextColor = ThemeColors(
//     lightModePrimary: Colors.black,
//     darkModePrimary: Colors.white,
//   );
//
//   static const ThemeColors hintTextColor = ThemeColors(
//     lightModePrimary: Colors.grey,
//     darkModePrimary: Colors.grey,
//   );
//
//   static const ThemeColors primaryContainerBackgroundColor = ThemeColors(
//     lightModePrimary: Colors.blueGrey,
//     darkModePrimary: Colors.blueGrey,
//   );
//
//   static const ThemeColors elevatedButtonBackgroundColor = ThemeColors(
//     lightModePrimary: Colors.blueGrey,
//     darkModePrimary: Colors.blueGrey,
//   );
//
//   static const ThemeColors elevatedButtonTextColor = ThemeColors(
//     lightModePrimary: Colors.white,
//     darkModePrimary: Colors.white,
//   );
//
//   static const Color snackBarErrorBackgroundColor = Colors.red;
//   static const Color snackBarErrorTextColor = Colors.white;
//   static const Color snackBarSuccessBackgroundColor = Colors.green;
//   static const Color snackBarSuccessTextColor = Colors.white;
//   static const Color snackBarInfoBackgroundColor = Colors.grey;
//   static const Color snackBarInfoTextColor = Colors.white;
//
//   // FONT TYPES:
//
//   static const FontConfig appBarTextStyle = FontConfig(
//     name: 'Roboto',
//     isGoogleFont: true, // Set to false if using a custom font
//   );
//
//   static const FontConfig primaryTextStyle = FontConfig(
//     name: 'Roboto',
//     isGoogleFont: true, // Set to false if using a custom font
//   );
//
//   static const FontConfig secondaryTextStyle = FontConfig(
//     name: 'Open Sans',
//     isGoogleFont: true, // Set to false if using a custom font
//   );
//
//   static const FontConfig tertiaryTextStyle = FontConfig(
//     name: 'Lato',
//     isGoogleFont: true, // Set to false if using a custom font
//   );
//
//   static const FontConfig snackbarTextStyle = FontConfig(
//     name: 'Roboto',
//     isGoogleFont: true, // Set to false if using a custom font
//   );
//
//   // FONT SIZES:
//
//   static const double appBarTitleFontSize = 20;
//   static const double bodyLargeFontSize = 16; // Input fields text
//   static const double bodyMediumFontSize = 13; // Default Text() font size
//   static const double bodySmallFontSize = 12;
//   static const double snackbarFontSize = 14;
//
//   // SHADOWS:
//
//   static const double buttonsElevation = 1.1;
//
//   //-----------------------
//
//   //
//
//   //-----------------------
//
//   // UTILS (DO NOT EDIT):
//
//   static const lightBlackColor = Color(0xFF121212);
//   static const lightWhiteColor = Color(0xFFFFF8FE);
//
//   static const TextThemes textThemes = TextThemes(
//     primaryFont: primaryTextStyle,
//     secondaryFont: secondaryTextStyle,
//     tertiaryFont: tertiaryTextStyle,
//   );
// }
