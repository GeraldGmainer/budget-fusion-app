import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import 'memory_cache.dart';
import 'memory_cache_impl.dart';

@lazySingleton
class CacheManager {
  static const defaultCacheDuration = Duration(minutes: 5);
  final Map<EntityType, MemoryCache<dynamic>> _caches = {};

  T? get<T>(EntityType key) {
    return _caches[key]?.get();
  }

  void set<T>(EntityType key, T value, {Duration cacheDuration = defaultCacheDuration}) {
    _caches[key] ??= MemoryCacheImpl<T>(cacheDuration: cacheDuration);
    _caches[key]!.set(value);
  }

  Future<void> updateList<T>(EntityType key, FutureOr<List<T>> Function(List<T>?) update) async {
    final currentList = get<List<T>>(key) ?? [];
    final updatedList = await update(currentList);
    set<List<T>>(key, updatedList);
  }

  void invalidateCache(EntityType key) {
    _caches[key]?.invalidate();
  }

  void invalidateAll() {
    for (var cache in _caches.values) {
      cache.invalidate();
    }
  }
}
