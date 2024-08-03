import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:flutter/services.dart';
import 'package:template_app/app_settings/auth_config.dart';
import 'package:template_app/generated/l10n.dart';
import '../../../app_settings/theme_settings.dart';
import '../../../providers/providers_all.dart';
import '../../../utils/ui/is_dark_mode.dart';
import '../../../utils/validation/is_email_valid.dart';
import '../../../widgets/AppScaffold/app_scaffold.dart';
import '../../../widgets/NotificationModal/notification_modal.dart';
import '../../../widgets/NotificationSnackbar/notification_snackbar.dart';
import '../../../widgets/ThemeInputTextField/theme_input_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  final int minPasswordLength = 6;
  bool _attemptingLogin = false;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeProvider);
    final isDarkMode = themeNotifier.themeMode == ThemeMode.dark;
    return AppScaffold(
      appBarTitle: S.of(context).loginScreenTitle,
      isProtected: false,
      useSafeArea: false,
      hideFloatingSpeedDialMenu: true,
      backgroundAnimation: ThemeSettings.primaryLottieBackgroundAnimation,
      backgroundAnimationDarkMode:
          ThemeSettings.secondaryLottieBackgroundAnimation,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 120),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.email_outlined),
                          const SizedBox(width: 5),
                          Text(
                            S.of(context).emailLabel,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ThemeInputTextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      hintText: S.of(context).emailHintText,
                      isEmailInput: true,
                      isValid: _isEmailValid,
                      errorText: S.of(context).invalidEmailMessage,
                      onChanged: (value) {
                        if (isEmailValid(value)) {
                          setState(() {
                            _isEmailValid = true;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.lock_outline),
                          const SizedBox(width: 5),
                          Text(
                            S.of(context).passwordLabel,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ThemeInputTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      hintText: S.of(context).passwordHintText,
                      isPasswordInput: true,
                      hidePasswordVisibilityIcon: false,
                      isValid: _isPasswordValid,
                      errorText: S.of(context).invalidPasswordMessage,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            value.length >= minPasswordLength) {
                          setState(() {
                            _isPasswordValid = true;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: 233,
                      child: ElevatedButton(
                        onPressed: _attemptingLogin
                            ? null
                            : () => attemptLoginWithEmailAndPassword(ref),
                        child: Text(S.of(context).loginButton),
                      ),
                    ),
                    Visibility(
                      visible: AuthConfig.allowGoogleSignIn,
                      child: Column(
                        children: [
                          const SizedBox(height: 22.0),
                          SignInButton(Buttons.google,
                              elevation: ThemeSettings.buttonsElevation,
                              padding: const EdgeInsets.all(5.5),
                              clipBehavior: Clip.hardEdge,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      ThemeSettings.buttonsBorderRadius),
                              text: S.of(context).signInWithGoogleButtonLabel,
                              onPressed: () async {
                            if (AuthConfig.allowGoogleSignIn) {
                              attemptLoginWithGoogle(ref);
                            }
                          }),
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).lightMode,
                          style: TextStyle(
                            fontWeight: isDarkMode
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                        const Text(
                          ' / ',
                        ),
                        Text(
                          S.of(context).darkMode,
                          style: TextStyle(
                            fontWeight: isDarkMode
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Switch(
                      thumbIcon: WidgetStateProperty.all(Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.white,
                      )),
                      value: isDarkMode,
                      onChanged: (value) {
                        ref.read(themeProvider).toggleTheme(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(localeProvider)
                                .setLocale(const Locale('en'));
                          },
                          child: const Text(
                            '🇺🇸',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('/'),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(localeProvider)
                                .setLocale(const Locale('es'));
                          },
                          child: const Text(
                            '🇪🇸',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text('/'),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(localeProvider)
                                .setLocale(const Locale('de'));
                          },
                          child: const Text(
                            '🇩🇪',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void attemptLoginWithEmailAndPassword(WidgetRef ref) async {
    debugPrint('Attempting login...');
    var error = false;
    setState(() {
      _isEmailValid = true;
      _isPasswordValid = true;
    });

    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      List<String> emptyFields = [];
      if (_emailController.text.isEmpty) {
        debugPrint('Please insert a valid email');
        emptyFields.add(S.of(context).email);
        setState(() {
          _isEmailValid = false;
        });
        NotificationSnackbar.showSnackBar(
          message: S.of(context).invalidEmailSnackbarMessage,
          variant: SnackbarVariant.error,
          duration: SnackbarDuration.short,
        );
      }
      if (_passwordController.text.isEmpty) {
        debugPrint('Please insert a valid password');
        emptyFields.add(S.of(context).password);
        setState(() {
          _isPasswordValid = false;
        });
        NotificationSnackbar.showSnackBar(
          message: S.of(context).invalidPasswordSnackbarMessage,
          variant: SnackbarVariant.error,
          duration: SnackbarDuration.short,
        );
        error = true;
      }

      debugPrint('Error: The following fields are empty: $emptyFields');

      NotificationSnackbar.showSnackBar(
        message:
            '${S.of(context).pleaseFillTheFollowingFields} ${emptyFields.join(', ')}.',
        variant: SnackbarVariant.error,
        duration: SnackbarDuration.short,
      );
      error = true;

      NotificationModal.loginFieldsAreEmpty(
          context: context, onTapConfirm: () {}, emptyFields: emptyFields);
    }

    if (_emailController.text.isNotEmpty &&
        !isEmailValid(_emailController.text)) {
      debugPrint('Email is not valid');
      setState(() {
        _isEmailValid = false;
      });
      NotificationSnackbar.showSnackBar(
        message: S.of(context).invalidEmailMessage,
        variant: SnackbarVariant.error,
        duration: SnackbarDuration.short,
      );
      error = true;
    }

    if (_passwordController.text.isNotEmpty &&
        _passwordController.text.length < minPasswordLength) {
      debugPrint('Password is too short. Minimum length: $minPasswordLength');
      setState(() {
        _isPasswordValid = false;
      });
      NotificationSnackbar.showSnackBar(
        message: S.of(context).invalidPasswordTooShortMessage,
        variant: SnackbarVariant.error,
        duration: SnackbarDuration.short,
      );
      error = true;
    }

    if (error) {
      debugPrint('Login aborted.');
      return;
    }

    setState(() {
      _attemptingLogin = true;
    });

    NotificationSnackbar.showSnackBar(
      message: S.of(context).signingInMessage,
      variant: SnackbarVariant.info,
      duration: SnackbarDuration.long,
    );
    try {
      bool userSignedIn = await ref
          .read(authProvider)
          .signInWithEmail(_emailController.text, _passwordController.text);

      if (userSignedIn) {
        void userTappedConfirm() {
          NotificationSnackbar.hideCurrentSnackBar();
          NotificationSnackbar.showSnackBar(
              message: S.of(context).loginSuccessfulMessage,
              variant: SnackbarVariant.success,
              duration: SnackbarDuration.short,
              delay: 1);
          context.go('/');
        }

        if (mounted) {
          NotificationModal.successfulModal(
              title: S.of(context).successfulLogin,
              message: S.of(context).successfulLoginRedirectToHomeMessage,
              context: context,
              onTapConfirm: () => userTappedConfirm());
        }
      } else {
        if (mounted) {
          NotificationSnackbar.showSnackBar(
            message: S.of(context).loginErrorMessage,
            variant: SnackbarVariant.error,
            duration: SnackbarDuration.long,
          );
        }
      }
    } catch (error) {
      if (mounted) {
        NotificationSnackbar.showSnackBar(
          message: S.of(context).loginErrorMessage,
          variant: SnackbarVariant.error,
          duration: SnackbarDuration.long,
        );
      }
      if (mounted) {
        NotificationModal.failedLogin(
            context: context,
            onTapConfirm: () {},
            errorMessage: S.of(context).loginErrorMessage);
        debugPrint('Error logging in: ${error.toString()}');
      }
    } finally {
      setState(() {
        _attemptingLogin = false;
      });
      NotificationSnackbar.hideCurrentSnackBar();
    }
  }

  void attemptLoginWithGoogle(WidgetRef ref) async {
    NotificationSnackbar.showSnackBar(
      message: S.of(context).signingInWithGoogleSnackbarMessage,
      variant: SnackbarVariant.info,
      duration: SnackbarDuration.long,
    );
    try {
      bool userSignedIn = await ref.read(authProvider).signInWithGoogle();
      if (userSignedIn) {
        if (mounted) {
          NotificationModal.successfulModal(
            title: S.of(context).successfulLogin,
            message: S.of(context).successfulLoginRedirectToHomeMessage,
            context: context,
            onTapConfirm: () {
              NotificationSnackbar.hideCurrentSnackBar();
              NotificationSnackbar.showSnackBar(
                message: S.of(context).loginSuccessfulMessage,
                variant: SnackbarVariant.success,
                duration: SnackbarDuration.short,
                delay: 1,
              );
              context.go('/');
            },
          );
        }
      } else {
        if (mounted) {
          NotificationSnackbar.showSnackBar(
            message: S.of(context).loginErrorMessage,
            variant: SnackbarVariant.error,
            duration: SnackbarDuration.long,
          );
        }
      }
    } on PlatformException catch (error) {
      if (mounted) {
        NotificationSnackbar.showSnackBar(
          message: S.of(context).errorSigningInWithGoogleSnackbarMessage,
          variant: SnackbarVariant.error,
          duration: SnackbarDuration.long,
        );
      }

      debugPrint('Error signing in with Google: ${error.toString()}');
    } catch (error) {
      if (mounted) {
        NotificationSnackbar.showSnackBar(
          message: S.of(context).errorSigningInWithGoogleSnackbarMessage,
          variant: SnackbarVariant.error,
          duration: SnackbarDuration.long,
        );
      }

      debugPrint('Error: ${error.toString()}');
    }
  }
}
