import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import 'memory_cache.dart';
import 'memory_cache_impl.dart';

@lazySingleton
class CacheManager {
  static const defaultCacheDuration = Duration(minutes: 5);
  final Map<DomainType, MemoryCache<dynamic>> _caches = {};

  T? get<T>(DomainType key) {
    return _caches[key]?.get();
  }

  void set<T>(DomainType key, T value, {Duration cacheDuration = defaultCacheDuration}) {
    _caches[key] ??= MemoryCacheImpl<T>(cacheDuration: cacheDuration);
    _caches[key]!.set(value);
  }

  void updateList<T>(DomainType key, List<T> Function(List<T>?) update) {
    final currentList = get<List<T>>(key) ?? [];
    final updatedList = update(currentList);
    set<List<T>>(key, updatedList);
  }

  void invalidateCache(DomainType key) {
    _caches[key]?.invalidate();
  }

  void invalidateAll() {
    for (var cache in _caches.values) {
      cache.invalidate();
    }
  }
}
