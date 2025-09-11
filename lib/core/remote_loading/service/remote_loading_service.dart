import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants/feature_constants.dart';

@lazySingleton
class RemoteLoadingService {
  final BehaviorSubject<bool> _controller = BehaviorSubject<bool>.seeded(false);
  int _counter = 0;
  DateTime? _lastShownAt;

  Stream<bool> get stream => _controller.stream;

  void increment() {
    _counter++;
    if (_counter == 1) {
      _lastShownAt = DateTime.now();
      _controller.add(true);
    }
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
    }
    if (_counter == 0) {
      final now = DateTime.now();
      final elapsed = _lastShownAt == null ? Duration.zero : now.difference(_lastShownAt!);

      if (elapsed >= FeatureConstants.loadingIndicatorMinDuration) {
        _controller.add(false);
      } else {
        Future.delayed(FeatureConstants.loadingIndicatorMinDuration - elapsed, () {
          if (_counter == 0) {
            _controller.add(false);
          }
        });
      }
    }
  }

  Future<T> wrap<T>(Future<T> Function() operation) async {
    increment();
    try {
      return await operation();
    } finally {
      decrement();
    }
  }
}
