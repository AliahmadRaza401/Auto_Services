import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  /// Variables
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;

  /// Initialize the Network Manager and set up a stream to continually check internet connectivity status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  /// Update the connection status based on changes in connectivity
  void _updateConnectionStatus(List<ConnectivityResult> event) {
    _connectivityStatus.value = event.first;
    if (_connectivityStatus.value == ConnectivityResult.none) {}
  }

  /// Checks the internet status
  /// Return 'true' if connected
  /// Return 'false' if not connected
  Future<bool> isConnected() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (result.first != ConnectivityResult.none) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
