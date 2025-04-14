import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class RemoteLoadingService {
  final BehaviorSubject<bool> _controller = BehaviorSubject<bool>.seeded(false);
  int _counter = 0;

  Stream<bool> get stream => _controller.stream;

  void increment() {
    _counter++;
    _controller.add(_counter > 0);
  }

  void decrement() {
    if (_counter > 0) _counter--;
    _controller.add(_counter > 0);
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
