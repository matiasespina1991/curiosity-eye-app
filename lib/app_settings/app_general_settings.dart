import '../routes/routes.dart';

class AppGeneralSettings {
  static const bool useTopAppBar = false;
  static const bool useFloatingSpeedDialMenu = true;
  static const bool useAppDrawerMenu = false;
  static const String minimumiOSVersion =
      '13.0'; // Set this manually in Xcode & Podfile
  static const String minimumAndroidVersion =
      '23'; // Set this manually in android/app/build.gradle
}

class DebugConfig {
  static const bool debugMode = true;
  static const String? debugDatabaseId =
      null; // The ID you set in Firebase for the database you will be using for debugging - If Null, main database will be used.
  static const bool showDebugPrints = false;
  static const bool bypassLoginScreen =
      false; // If true, login screen will be skipped
  static RouteConfig debugScreen = Routes.notFoundScreen;
  static const forceDebugScreen =
      false; // If true, the route set in debugScreen will be shown and screen protection will be ignored
}
