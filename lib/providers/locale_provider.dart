import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:template_app/app_settings/language_settings.dart';

class LocaleProvider extends ChangeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Locale _locale = Locale(
    LanguageSettings.supportedLocales
            .contains(LanguageSettings.appDefaultLanguage)
        ? LanguageSettings.appDefaultLanguage
        : LanguageSettings.supportedLocales.first,
  );

  LocaleProvider() {
    _loadLocale();
  }

  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (LanguageSettings.forceDefaultLanguage) {
      debugPrint(
          'Error: Language change forbidden. Forced locale is on. Set LanguageSettings.forceLanguage to "false" in order to allow language change.');
      return;
    }

    if (!LanguageSettings.supportedLocales.contains(locale.languageCode)) {
      debugPrint(
          'Unsupported locale: ${locale.languageCode.toUpperCase()}, please use one of the following: ${LanguageSettings.supportedLocales}. Or add the new locale to the supportedLocales list in config.dart');
      return;
    }

    _locale = locale;
    notifyListeners();
    await _storage.write(
        key: 'user_defined_locale', value: locale.languageCode);
  }

  Future<void> _loadLocale() async {
    String? languageCode = await _storage.read(key: 'user_defined_locale');
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }
}
