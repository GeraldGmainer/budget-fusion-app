import 'package:flutter/material.dart';

class BootstrapNavObserver extends NavigatorObserver {
  BootstrapNavObserver(this.ready);

  final ValueNotifier<bool> ready;
  bool _set = false;

  @override
  void didPush(Route route, Route<dynamic>? previousRoute) {
    if (_set) return;
    _set = true;
    ready.value = true;
  }
}
