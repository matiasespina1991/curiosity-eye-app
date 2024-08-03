import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template_app/app_settings/theme_settings.dart';
import 'package:template_app/generated/l10n.dart';
import 'package:intl/intl.dart';

class NotificationModal {
  static void successfulModal({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onTapConfirm,
  }) {
    showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: ThemeSettings.snackBarSuccessBackgroundColor,
                  radius: 30,
                  child: Icon(Icons.check, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(message, style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).gotIt),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void failedLogin({
    required BuildContext context,
    required VoidCallback onTapConfirm,
    required String errorMessage,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  radius: 30,
                  child: const Icon(Icons.close, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(S.of(context).loginFailed,
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  child: Text(errorMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void loginFieldsAreEmpty({
    required BuildContext context,
    required Function onTapConfirm,
    required List<String> emptyFields,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.warning, size: 50, color: Colors.amber),
                const SizedBox(height: 15),
                Text(S.of(context).emptyFields,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(S.of(context).fillAllFields,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 5),
                ...emptyFields
                    .map((element) => Text(toBeginningOfSentenceCase(element),
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ))),
                const SizedBox(height: 17),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void failedLogout({
    required BuildContext context,
    required onTapConfirm,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  radius: 30,
                  child: const Icon(Icons.close, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(S.of(context).failedLogout,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(S.of(context).failedLogoutMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void unauthorizedAccess({
    required BuildContext context,
    required onTapConfirm,
    required String screenName,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  radius: 30,
                  child: const Icon(Icons.close, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(S.of(context).unauthorizedAccess,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(S.of(context).unauthorizedAccessMessage(screenName),
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void noInternetConnection({
    required BuildContext context,
    required onTapConfirm,
  }) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.wifi_off, size: 50, color: Colors.grey),
                const SizedBox(height: 20),
                Text(S.of(context).noInternetConnection,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  child: Text(S.of(context).youAreCurrentlyOfflineMessage,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void backToInternetConnection({
    required BuildContext context,
    required onTapConfirm,
  }) {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.wifi, size: 50, color: Colors.green),
                const SizedBox(height: 20),
                Text(S.of(context).backToInternetConnection,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  child: Text(S.of(context).backToInternetConnection,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void unableToLoginDueToNoInternet({
    required BuildContext context,
    required onTapConfirm,
  }) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Icon(Icons.signal_wifi_connected_no_internet_4_outlined,
                    size: 50, color: Colors.grey),
                const SizedBox(height: 20),
                Text(S.of(context).unableToLoginNoInternet,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                SizedBox(
                  width: 300,
                  child: Text(S.of(context).noInternetMessageOnLoginAttempt,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      onTapConfirm();
                    },
                    child: Text(S.of(context).ok),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
