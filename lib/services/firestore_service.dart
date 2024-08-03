import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../app_settings/app_general_settings.dart';

class FirestoreService {
  static final FirebaseFirestore _firestoreInstance =
      DebugConfig.debugMode ? getDebugDatabase() : getMainDatabase();

  static const String? _debugDatabaseId = DebugConfig.debugDatabaseId;

  static FirebaseFirestore get instance => _firestoreInstance;

  static FirebaseFirestore getMainDatabase() {
    debugPrint('[Using main database]');
    return FirebaseFirestore.instance;
  }

  static FirebaseFirestore getDebugDatabase() {
    if (_debugDatabaseId == null) {
      debugPrint('[Debug database ID not set! Using main database.]');
      return getMainDatabase();
    }
    debugPrint('[Using debug database: $_debugDatabaseId]');
    try {
      return FirebaseFirestore.instanceFor(
        app: FirebaseFirestore.instance.app,
        databaseId: _debugDatabaseId,
      );
    } catch (e) {
      debugPrint('[Failed to get debug database: $e. Using main database.]');
      return getMainDatabase();
    }
  }
}
