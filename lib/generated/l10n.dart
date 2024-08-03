// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `Login screen`
  String get loginScreenTitle {
    return Intl.message(
      'Login screen',
      name: 'loginScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `EMAIL`
  String get emailLabel {
    return Intl.message(
      'EMAIL',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `PASSWORD`
  String get passwordLabel {
    return Intl.message(
      'PASSWORD',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutButton {
    return Intl.message(
      'Logout',
      name: 'logoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsButton {
    return Intl.message(
      'Settings',
      name: 'settingsButton',
      desc: '',
      args: [],
    );
  }

  /// `Signing in...`
  String get signingInMessage {
    return Intl.message(
      'Signing in...',
      name: 'signingInMessage',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginSuccessfulMessage {
    return Intl.message(
      'Login successful!',
      name: 'loginSuccessfulMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error logging in. Please try again or contact support.`
  String get loginErrorMessage {
    return Intl.message(
      'Error logging in. Please try again or contact support.',
      name: 'loginErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please insert a valid email.`
  String get invalidEmailMessage {
    return Intl.message(
      'Please insert a valid email.',
      name: 'invalidEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please insert a valid password.`
  String get invalidPasswordMessage {
    return Intl.message(
      'Please insert a valid password.',
      name: 'invalidPasswordMessage',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode/Dark Mode`
  String get lightModeDarkMode {
    return Intl.message(
      'Light Mode/Dark Mode',
      name: 'lightModeDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message(
      'Light Mode',
      name: 'lightMode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch to dark mode`
  String get switchToDarkMode {
    return Intl.message(
      'Switch to dark mode',
      name: 'switchToDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Switch to light mode`
  String get switchToLightMode {
    return Intl.message(
      'Switch to light mode',
      name: 'switchToLightMode',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHintText {
    return Intl.message(
      'Email',
      name: 'emailHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHintText {
    return Intl.message(
      'Password',
      name: 'passwordHintText',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters long.`
  String get invalidPasswordTooShortMessage {
    return Intl.message(
      'Password must be at least 6 characters long.',
      name: 'invalidPasswordTooShortMessage',
      desc: '',
      args: [],
    );
  }

  /// `The email address inserted is not valid.`
  String get invalidEmailSnackbarMessage {
    return Intl.message(
      'The email address inserted is not valid.',
      name: 'invalidEmailSnackbarMessage',
      desc: '',
      args: [],
    );
  }

  /// `The password inserted is not valid.`
  String get invalidPasswordSnackbarMessage {
    return Intl.message(
      'The password inserted is not valid.',
      name: 'invalidPasswordSnackbarMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the following fields:`
  String get pleaseFillTheFollowingFields {
    return Intl.message(
      'Please fill the following fields:',
      name: 'pleaseFillTheFollowingFields',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogleButtonLabel {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogleButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Signing in with Google...`
  String get signingInWithGoogleSnackbarMessage {
    return Intl.message(
      'Signing in with Google...',
      name: 'signingInWithGoogleSnackbarMessage',
      desc: '',
      args: [],
    );
  }

  /// `There was an error signing in with Google. Please try again or contact support.`
  String get errorSigningInWithGoogleSnackbarMessage {
    return Intl.message(
      'There was an error signing in with Google. Please try again or contact support.',
      name: 'errorSigningInWithGoogleSnackbarMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreenTitle {
    return Intl.message(
      'Home Screen',
      name: 'homeScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Example Title`
  String get exampleTitle {
    return Intl.message(
      'Example Title',
      name: 'exampleTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is a creative lorem ipsum example description for the Home screen. Feel free to modify it.`
  String get exampleDescription {
    return Intl.message(
      'This is a creative lorem ipsum example description for the Home screen. Feel free to modify it.',
      name: 'exampleDescription',
      desc: '',
      args: [],
    );
  }

  /// `Buttons`
  String get buttonsSectionTitle {
    return Intl.message(
      'Buttons',
      name: 'buttonsSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Elevated Button`
  String get elevatedButtonLabel {
    return Intl.message(
      'Elevated Button',
      name: 'elevatedButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Text Button`
  String get textButtonLabel {
    return Intl.message(
      'Text Button',
      name: 'textButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Outlined Button`
  String get outlinedButtonLabel {
    return Intl.message(
      'Outlined Button',
      name: 'outlinedButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Switches`
  String get switchesSectionTitle {
    return Intl.message(
      'Switches',
      name: 'switchesSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Example Switch`
  String get exampleSwitch {
    return Intl.message(
      'Example Switch',
      name: 'exampleSwitch',
      desc: '',
      args: [],
    );
  }

  /// `Inputs`
  String get inputsSectionTitle {
    return Intl.message(
      'Inputs',
      name: 'inputsSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Example TextField`
  String get textFieldLabel {
    return Intl.message(
      'Example TextField',
      name: 'textFieldLabel',
      desc: '',
      args: [],
    );
  }

  /// `Steppers`
  String get steppersSectionTitle {
    return Intl.message(
      'Steppers',
      name: 'steppersSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step One`
  String get stepOneTitle {
    return Intl.message(
      'Step One',
      name: 'stepOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is the content for step one.`
  String get stepOneContent {
    return Intl.message(
      'This is the content for step one.',
      name: 'stepOneContent',
      desc: '',
      args: [],
    );
  }

  /// `Step Two`
  String get stepTwoTitle {
    return Intl.message(
      'Step Two',
      name: 'stepTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is the content for step two.`
  String get stepTwoContent {
    return Intl.message(
      'This is the content for step two.',
      name: 'stepTwoContent',
      desc: '',
      args: [],
    );
  }

  /// `Step Three`
  String get stepThreeTitle {
    return Intl.message(
      'Step Three',
      name: 'stepThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is the content for step three.`
  String get stepThreeContent {
    return Intl.message(
      'This is the content for step three.',
      name: 'stepThreeContent',
      desc: '',
      args: [],
    );
  }

  /// `Chips`
  String get chipsSectionTitle {
    return Intl.message(
      'Chips',
      name: 'chipsSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Chip One`
  String get chipOneLabel {
    return Intl.message(
      'Chip One',
      name: 'chipOneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chip Two`
  String get chipTwoLabel {
    return Intl.message(
      'Chip Two',
      name: 'chipTwoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Chip Three`
  String get chipThreeLabel {
    return Intl.message(
      'Chip Three',
      name: 'chipThreeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sliders`
  String get slidersSectionTitle {
    return Intl.message(
      'Sliders',
      name: 'slidersSectionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Slider Value`
  String get sliderValueLabel {
    return Intl.message(
      'Slider Value',
      name: 'sliderValueLabel',
      desc: '',
      args: [],
    );
  }

  /// `Example of Display `
  String get exampleDisplayLargePrefix {
    return Intl.message(
      'Example of Display ',
      name: 'exampleDisplayLargePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Display `
  String get exampleDisplayMediumPrefix {
    return Intl.message(
      'Example of Display ',
      name: 'exampleDisplayMediumPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Display `
  String get exampleDisplaySmallPrefix {
    return Intl.message(
      'Example of Display ',
      name: 'exampleDisplaySmallPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Headline `
  String get exampleHeadlineLargePrefix {
    return Intl.message(
      'Example of Headline ',
      name: 'exampleHeadlineLargePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Headline `
  String get exampleHeadlineMediumPrefix {
    return Intl.message(
      'Example of Headline ',
      name: 'exampleHeadlineMediumPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Headline `
  String get exampleHeadlineSmallPrefix {
    return Intl.message(
      'Example of Headline ',
      name: 'exampleHeadlineSmallPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Title `
  String get exampleTitleLargePrefix {
    return Intl.message(
      'Example of Title ',
      name: 'exampleTitleLargePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Title `
  String get exampleTitleMediumPrefix {
    return Intl.message(
      'Example of Title ',
      name: 'exampleTitleMediumPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Title `
  String get exampleTitleSmallPrefix {
    return Intl.message(
      'Example of Title ',
      name: 'exampleTitleSmallPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Body `
  String get exampleBodyLargePrefix {
    return Intl.message(
      'Example of Body ',
      name: 'exampleBodyLargePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Body `
  String get exampleBodyMediumPrefix {
    return Intl.message(
      'Example of Body ',
      name: 'exampleBodyMediumPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Body `
  String get exampleBodySmallPrefix {
    return Intl.message(
      'Example of Body ',
      name: 'exampleBodySmallPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Label `
  String get exampleLabelLargePrefix {
    return Intl.message(
      'Example of Label ',
      name: 'exampleLabelLargePrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Label `
  String get exampleLabelMediumPrefix {
    return Intl.message(
      'Example of Label ',
      name: 'exampleLabelMediumPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Example of Label `
  String get exampleLabelSmallPrefix {
    return Intl.message(
      'Example of Label ',
      name: 'exampleLabelSmallPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Successful Login`
  String get successfulLogin {
    return Intl.message(
      'Successful Login',
      name: 'successfulLogin',
      desc: '',
      args: [],
    );
  }

  /// `You will be redirected to the main screen.`
  String get successfulLoginRedirectToHomeMessage {
    return Intl.message(
      'You will be redirected to the main screen.',
      name: 'successfulLoginRedirectToHomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `There was an error logging in. Please try again.`
  String get loginFailedMessage {
    return Intl.message(
      'There was an error logging in. Please try again.',
      name: 'loginFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Some fields are empty`
  String get emptyFields {
    return Intl.message(
      'Some fields are empty',
      name: 'emptyFields',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the following field/s:`
  String get fillAllFields {
    return Intl.message(
      'Please fill the following field/s:',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Failed Logout`
  String get failedLogout {
    return Intl.message(
      'Failed Logout',
      name: 'failedLogout',
      desc: '',
      args: [],
    );
  }

  /// `There was an error when trying to logout. Please try again.`
  String get failedLogoutMessage {
    return Intl.message(
      'There was an error when trying to logout. Please try again.',
      name: 'failedLogoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized Access`
  String get unauthorizedAccess {
    return Intl.message(
      'Unauthorized Access',
      name: 'unauthorizedAccess',
      desc: '',
      args: [],
    );
  }

  /// `You need to login to access {screenName}.`
  String unauthorizedAccessMessage(Object screenName) {
    return Intl.message(
      'You need to login to access $screenName.',
      name: 'unauthorizedAccessMessage',
      desc: '',
      args: [screenName],
    );
  }

  /// `Unable to Login`
  String get unableToLoginNoInternet {
    return Intl.message(
      'Unable to Login',
      name: 'unableToLoginNoInternet',
      desc: '',
      args: [],
    );
  }

  /// `You tried to login but you don't have internet connection. Please connect to the internet and try again.`
  String get noInternetMessageOnLoginAttempt {
    return Intl.message(
      'You tried to login but you don\'t have internet connection. Please connect to the internet and try again.',
      name: 'noInternetMessageOnLoginAttempt',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get noInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `You are currently offline. Please check your internet connection.`
  String get youAreCurrentlyOfflineMessage {
    return Intl.message(
      'You are currently offline. Please check your internet connection.',
      name: 'youAreCurrentlyOfflineMessage',
      desc: '',
      args: [],
    );
  }

  /// `You are back online`
  String get backToInternetConnection {
    return Intl.message(
      'You are back online',
      name: 'backToInternetConnection',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
