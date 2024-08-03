import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:curiosity_eye_app/providers/providers_all.dart';
import 'package:curiosity_eye_app/routes/routes.dart';
import 'app_settings/auth_config.dart';
import 'globals.dart';
import 'app_settings/app_info.dart';
import 'app_settings/language_settings.dart';
import 'app_settings/theme_settings.dart';
import 'theme/main_theme/main_theme.dart';
import 'utils/debug/log_configurations.dart';
import 'generated/l10n.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider);
    final localeNotifier = ref.watch(localeProvider);
    final isDarkMode = themeNotifier.themeMode == ThemeMode.dark;

    return MaterialApp.router(
      scaffoldMessengerKey: snackbarKey,
      title: AppInfo.appName,
      theme: MainTheme.lightTheme,
      darkTheme: MainTheme.darkTheme,
      themeMode: themeNotifier.themeMode,
      locale: localeNotifier.locale,
      supportedLocales: LanguageSettings.supportedLocales
          .map((e) => Locale.fromSubtags(languageCode: e))
          .toList(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (LanguageSettings.forceDefaultLanguage) {
          return const Locale(LanguageSettings.appDefaultLanguage);
        }
        if (locale != null) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return supportedLocales.first;
      },
      routerDelegate: Routes.router.routerDelegate,
      routeInformationParser: Routes.router.routeInformationParser,
      routeInformationProvider: Routes.router.routeInformationProvider,
    );
  }
}
