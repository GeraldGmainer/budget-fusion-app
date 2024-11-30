import 'package:injectable/injectable.dart';

import 'cache_key.dart';
import 'in_memory_cache.dart';
import 'memory_cache.dart';

@lazySingleton
class CacheManager {
  final Map<CacheKey, MemoryCache<dynamic>> _caches = {};

  MemoryCache<T> getCache<T>(CacheKey key, {required Duration cacheDuration}) {
    if (_caches.containsKey(key)) {
      return _caches[key]! as MemoryCache<T>;
    } else {
      final cache = InMemoryCache<T>(cacheDuration: cacheDuration);
      _caches[key] = cache;
      return cache;
    }
  }

  void invalidateCache(CacheKey key) {
    _caches[key]?.invalidate();
  }

  void invalidateAll() {
    for (var cache in _caches.values) {
      cache.invalidate();
    }
  }
}
