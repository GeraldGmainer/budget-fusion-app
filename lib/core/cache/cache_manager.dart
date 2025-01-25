import 'package:injectable/injectable.dart';

import 'memory_cache.dart';
import 'memory_cache_impl.dart';

@lazySingleton
class CacheManager {
  static const defaultCacheDuration = Duration(minutes: 5);
  final Map<String, MemoryCache<dynamic>> _caches = {};

  T? get<T>(String key) {
    if (!_caches.containsKey(key)) {
      return null;
    }
    return _caches[key]!.get();
  }

  void set<T>(String key, T value, {Duration cacheDuration = defaultCacheDuration}) {
    if (!_caches.containsKey(key)) {
      _caches[key] = MemoryCacheImpl<T>(cacheDuration: cacheDuration);
    }
    _caches[key]!.set(value);
  }

  void invalidateCache(String key) {
    _caches[key]?.invalidate();
  }

  void invalidateAll() {
    for (var cache in _caches.values) {
      cache.invalidate();
    }
  }
}
