import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/foundation.dart';

import '../models/current_user_data.dart';

class ErrorReportingService {
  static Future<void> reportError(
      dynamic error, dynamic stackTrace, CurrentUserData? userData,
      {String screen = 'Not Specified',
      errorLocation = 'Not Specified',
      List<String>? additionalInfo}) async {
    final deviceData = await _getDeviceData();
    final appInfo = await _getAppInfo();

    final errorReport = {
      'timestamp': DateTime.now().toIso8601String(),
      'error': error.toString(),
      'screen': screen,
      'errorLocation': errorLocation,
      'user': userData != null
          ? {
              'id': userData.userId,
              'email': userData.email,
              'isAnonymous': userData.isAnonymous,
            }
          : 'No user data available',
      'deviceData': deviceData,
      'appInfo': appInfo,
      'stackTrace': stackTrace.toString(),
      additionalInfo: additionalInfo,
    };

    debugPrint("Error Report: $errorReport");

    // TODO: Send this data to your server or error tracking service.
  }

  static Future<Map<String, dynamic>> _getDeviceData() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return {
        'model': androidInfo.model,
        'manufacturer': androidInfo.manufacturer,
        'version': androidInfo.version.release,
        'device': androidInfo.device,
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return {
        'model': iosInfo.utsname.machine,
        'systemName': iosInfo.systemName,
        'version': iosInfo.systemVersion,
      };
    }
    return {};
  }

  static Future<Map<String, dynamic>> _getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return {
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }
}
