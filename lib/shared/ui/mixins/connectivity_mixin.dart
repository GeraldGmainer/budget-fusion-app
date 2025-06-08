import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

mixin ConnectivityMixin<T extends StatefulWidget> on State<T> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<List<ConnectivityResult>> _subscription;
  bool isOnline = true;

  @override
  void initState() {
    super.initState();
    _subscription = _connectivity.onConnectivityChanged.listen(_updateStatus);
    _connectivity.checkConnectivity().then(_updateStatus);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    isOnline = result != ConnectivityResult.none;
    onConnectivityChanged(result);
    if (mounted) setState(() {});
  }

  void onConnectivityChanged(ConnectivityResult result) {}

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
