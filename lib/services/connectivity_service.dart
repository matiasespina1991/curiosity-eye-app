import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityService with ChangeNotifier {
  List<ConnectivityResult> _connectivityStatus = [ConnectivityResult.none];

  ConnectivityService() {
    _initConnectivity();
    Connectivity().onConnectivityChanged.listen(_updateConnectivityStatus);
  }

  void _initConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectivityStatus(connectivityResult);
  }

  void _updateConnectivityStatus(List<ConnectivityResult> result) {
    _connectivityStatus = result;
    notifyListeners();
  }

  bool get isConnected =>
      !_connectivityStatus.contains(ConnectivityResult.none);
}
