import 'dart:async';

import 'package:synchronized/synchronized.dart';

import 'memory_cache.dart';

class InMemoryCache<V> implements MemoryCache<V> {
  final Duration cacheDuration;
  V? _value;
  DateTime? _timestamp;
  Future<V>? _ongoingFetch;
  final Lock _lock = Lock();

  InMemoryCache({required this.cacheDuration});

  @override
  V? get() {
    if (_value != null && _timestamp != null) {
      final isValid = DateTime.now().difference(_timestamp!) < cacheDuration;
      if (isValid) {
        return _value;
      } else {
        invalidate();
      }
    }
    return null;
  }

  @override
  void set(V value) {
    bool shouldCache = true;

    if (value is String && value.isEmpty) {
      shouldCache = false;
    } else if (value is Iterable && value.isEmpty) {
      shouldCache = false;
    } else if (value is Map && value.isEmpty) {
      shouldCache = false;
    }

    if (shouldCache) {
      _value = value;
      _timestamp = DateTime.now();
    }
  }

  @override
  Future<V> fetch(Future<V> Function() fetchFunction) async {
    return await _lock.synchronized(() async {
      final cachedValue = get();
      if (cachedValue != null) {
        return cachedValue;
      }

      if (_ongoingFetch != null) {
        return _ongoingFetch!;
      }

      _ongoingFetch = fetchFunction().then((value) {
        set(value);
        _ongoingFetch = null;
        return value;
      }).catchError((error) {
        _ongoingFetch = null;
        throw error;
      });

      return _ongoingFetch!;
    });
  }

  @override
  void invalidate() {
    _value = null;
    _timestamp = null;
  }
}
