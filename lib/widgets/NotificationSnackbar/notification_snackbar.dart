import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:template_app/app_settings/theme_settings.dart';

import '../../globals.dart';

class SnackbarDuration {
  static const String short = 'short';
  static const String long = 'long';
}

class SnackbarVariant {
  static const String error = 'error';
  static const String success = 'success';
  static const String info = 'info';
}

class NotificationSnackbar {
  static void showSnackBar({
    IconData? icon,
    required String message,
    required String variant,
    required String duration,
    int delay = 0,
  }) async {
    if (delay > 0) {
      await Future.delayed(Duration(seconds: delay));
    }

    if (ThemeSettings.useFlutterToast) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: message,
        toastLength: duration == SnackbarDuration.long
            ? Toast.LENGTH_LONG
            : Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: duration == SnackbarDuration.long ? 3 : 2,
        backgroundColor: variant == SnackbarVariant.success
            ? ThemeSettings.snackBarSuccessBackgroundColor
            : variant == SnackbarVariant.info
                ? ThemeSettings.snackBarInfoBackgroundColor
                : ThemeSettings.snackBarErrorBackgroundColor,
        textColor: ThemeSettings.snackBarErrorTextColor,
        fontSize: ThemeSettings.snackbarFontSize,
      );
      return;
    }

    snackbarKey.currentState?.showSnackBar(SnackBar(
      duration: duration == "infinite"
          ? const Duration(days: 1)
          : duration == SnackbarDuration.short
              ? const Duration(seconds: 2)
              : const Duration(seconds: 5),
      backgroundColor: variant == SnackbarVariant.success
          ? ThemeSettings.snackBarSuccessBackgroundColor
          : variant == SnackbarVariant.info
              ? ThemeSettings.snackBarInfoBackgroundColor
              : ThemeSettings.snackBarErrorBackgroundColor,
      content: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: variant == SnackbarVariant.success
                  ? ThemeSettings.snackBarSuccessTextColor
                  : variant == SnackbarVariant.info
                      ? ThemeSettings.snackBarInfoTextColor
                      : ThemeSettings.snackBarErrorTextColor,
            ),
          SizedBox(width: icon != null ? 8 : 0),
          Flexible(
            child: Text(message,
                style: TextStyle(
                    color: variant == SnackbarVariant.success
                        ? ThemeSettings.snackBarSuccessTextColor
                        : variant == SnackbarVariant.info
                            ? ThemeSettings.snackBarInfoTextColor
                            : ThemeSettings.snackBarErrorTextColor,
                    fontSize: ThemeSettings.snackbarFontSize)),
          ),
        ],
      ),
    ));
  }

  static void hideCurrentSnackBar() {
    if (ThemeSettings.useFlutterToast) {
      Fluttertoast.cancel();
      return;
    }
    snackbarKey.currentState?.hideCurrentSnackBar();
  }
}
