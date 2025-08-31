import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../singletons/connectivity_singleton.dart';

@lazySingleton
class ConnectivityService {
  final Connectivity _connectivity;
  final BehaviorSubject<bool> _online$ = BehaviorSubject.seeded(false);
  StreamSubscription<List<ConnectivityResult>>? _sub;

  ConnectivityService(this._connectivity);

  Stream<bool> get onlineStream => _online$.stream.distinct();

  bool get isOnline => _online$.value;

  bool get isOffline => !_online$.value;

  Future<void> start() async {
    final results = await _connectivity.checkConnectivity();
    _setResult(results);
    _sub = _connectivity.onConnectivityChanged.listen(_setResult);
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    await _online$.close();
  }

  Future<bool> checkNow() async {
    final results = await _connectivity.checkConnectivity();
    final value = _evaluate(results);
    _push(value);
    return value;
  }

  void _setResult(List<ConnectivityResult> results) {
    _push(_evaluate(results));
  }

  void _push(bool value) {
    if (_online$.value != value) {
      _online$.add(value);
      ConnectivitySingleton.instance.setConnected(value);
    }
  }

  bool _evaluate(List<ConnectivityResult> results) {
    return results.contains(ConnectivityResult.mobile) || results.contains(ConnectivityResult.wifi);
  }
}
