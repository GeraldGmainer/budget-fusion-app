import 'dart:async';

abstract class MemoryCache<V> {
  V? get();

  Future<V> fetch(Future<V> Function() fetchFunction);

  void set(V value);

  void invalidate();
}
