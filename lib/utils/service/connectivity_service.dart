import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../singletons/connectivity_singleton.dart';

@lazySingleton
class ConnectivityService {
  final Connectivity _connectivity;
  bool _isConnected = false;

  ConnectivityService(this._connectivity);

  bool get hasInternet => _isConnected;

  bool get hasNoInternet => !_isConnected;

  Future<void> start() async {
    await _initializeConnectivity();

    _connectivity.onConnectivityChanged.listen((results) {
      _setResult(results);
    });
  }

  Future<void> _initializeConnectivity() async {
    final results = await _connectivity.checkConnectivity();
    _setResult(results);
  }

  void _setResult(List<ConnectivityResult> results) {
    _isConnected = evaluateResult(results);
    ConnectivitySingleton.instance.setConnected(_isConnected);
  }

  Stream<List<ConnectivityResult>> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged;
  }

  evaluateResult(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi);
  }
}
