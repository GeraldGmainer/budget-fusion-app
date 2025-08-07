import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';
import '../../sync_manager/sync_manager.dart';
import '../cache/cache_manager.dart';
import '../models/queue_item.dart';
import '../queue/queue_manager.dart';
import '../realtime/realtime_notifier_service.dart';

class OfflineFirstDataManager<Dto extends OfflineFirstDto> {
  final EntityType entityType;
  final OfflineFirstLocalDataSource<Dto> localSource;

  final OfflineFirstRemoteDataSource<Dto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeNotifierService realtimeNotifierService;
  final RemoteLoadingService remoteLoadingService;

  ReplaySubject<List<SyncedDto<Dto>>> streamController = ReplaySubject<List<SyncedDto<Dto>>>(maxSize: 1);
  bool _isRealtimeSubscribed = false;
  Future<List<SyncedDto<Dto>>>? _refreshing;
  late final StreamSubscription<List<QueueItem>> _queueSub;

  OfflineFirstDataManager({
    required this.entityType,
    required this.localSource,
    required this.remoteSource,
    required this.cacheManager,
    required this.queueManager,
    required this.syncManager,
    required this.realtimeNotifierService,
    required this.remoteLoadingService,
  }) {
    queueManager.registerEntitySources(entityType, localSource, remoteSource);
    syncManager.register(entityType, this, localSource);

    _queueSub = queueManager.pendingItemsStream
        .map((items) => items.where((item) => item.entityType == entityType).toList())
        .distinct((prev, next) => const ListEquality<QueueItem>().equals(prev, next))
        .listen((_) async {
          final dtos = await _refreshCacheFromLocalSource();
          _emitToStream(dtos);
        });
  }

  Stream<List<SyncedDto<Dto>>> get stream => streamController.stream;

  Future<List<SyncedDto<Dto>>> loadAll({Map<String, dynamic>? filters}) async {
    _log("start loadAll");
    _subscribeToRealtime();
    final cached = cacheManager.get<List<SyncedDto<Dto>>>(entityType);
    if (cached != null && cached.isNotEmpty) {
      _log("Using cached data with ${cached.length} items");
      _emitToStream(cached);
      unawaited(syncManager.syncAll());
      return cached;
    }

    _log("Fetching local data ...");
    final localDtos = await localSource.fetchAll();
    if (localDtos.isNotEmpty) {
      _log("Local ${EntityLogger.bold(localDtos.length)} items found");
      cacheManager.set(entityType, localDtos);
      _emitToStream(localDtos);
      unawaited(syncManager.syncAll());
      return localDtos;
    }

    _log("No local data found. Fetching remote data ...");
    await syncManager.syncAll();
    final first = await streamController.first;
    _log("loadAll completed with ${first.length} items");
    return first;
  }

  Future<SyncedDto<Dto>?> loadById(String id) async {
    _log("start loadById '$id'");
    _subscribeToRealtime();
    final cached = cacheManager.get<List<SyncedDto<Dto>>>(entityType);
    if (cached != null) {
      final found = cached.firstWhereOrNull((e) => e.dto.id.value == id);
      if (found != null) {
        _log("Using cached data with ID '${found.dto.id}'");
        return found;
      }
    }
    _log("Fetching local data by id ...");
    final local = await localSource.fetchById(id);
    if (local != null) {
      _log("Local data by id '${local.dto.id}' found");
      return local;
    }
    _log("No local data found. Fetching remote data by id '$id' ...");

    await syncManager.syncAll();
    final local2 = await localSource.fetchById(id);
    if (local2 != null) {
      _log("Local data by id '${local2.dto.id}' found");
      return local2;
    }
    _log("No local data found after syncAll for ID '$id' ...");
    return null;
  }

  Future<void> refresh() async {
    _log("Refreshing local data ...");
    final localDtos = await localSource.fetchAll();
    cacheManager.set(entityType, localDtos);
    _emitToStream(localDtos);
  }

  Future<void> save(Dto dto) async {
    _log("Saving DTO with id '${dto.id.value}'");
    final now = DateTime.now();
    final existing = await localSource.fetchById(dto.id.value);
    final newMeta =
        (existing?.syncMeta != null)
            ? existing!.syncMeta.copyWith(status: SyncStatus.updatedLocally, modifiedLocallyAt: now)
            : SyncMeta(status: SyncStatus.createdLocally, modifiedLocallyAt: now, lastSyncedAt: null);
    final wrapped = SyncedDto<Dto>(dto: dto, syncMeta: newMeta);

    await localSource.save(wrapped);
    final refreshed = await _refreshCacheFromLocalSource();
    _emitToStream(refreshed);

    final payload = jsonEncode(dto.toJson());
    final item = QueueItem(entityId: dto.id.value, entityType: entityType, taskType: QueueTaskType.upsert, entityPayload: payload);
    _log("Queuing upsert for id '${dto.id.value}'");
    unawaited(queueManager.add(item));
  }

  Future<List<SyncedDto<Dto>>> _refreshCacheFromLocalSource() async {
    if (_refreshing != null) {
      return await _refreshing!;
    }
    _refreshing =
        (() async {
          final dtos = await localSource.fetchAll();
          cacheManager.set(entityType, dtos);
          return dtos;
        })();
    try {
      return await _refreshing!;
    } finally {
      _refreshing = null;
    }
  }

  Future<void> delete(Dto dto) async {
    _log("Deleting DTO with id '${dto.id.value}'");
    await localSource.deleteById(dto.id.value);

    final dtos = await _refreshCacheFromLocalSource();
    _emitToStream(dtos);

    final item = QueueItem(entityId: dto.id.value, entityType: entityType, taskType: QueueTaskType.delete, entityPayload: jsonEncode(dto.toJson()));
    _log("Queuing delete for id '${dto.id.value}'");
    unawaited(queueManager.add(item));
  }

  _emitToStream(List<SyncedDto<Dto>> dtos) {
    _log("Emitting ${EntityLogger.bold(dtos.length)} DTOs", darkColor: true);
    streamController.add(dtos);
  }

  void _subscribeToRealtime() {
    if (_isRealtimeSubscribed) return;
    _isRealtimeSubscribed = true;
    realtimeNotifierService.startListeningForEntity(entityType, remoteSource.table);
  }

  Future<void> reset() async {
    _log("Resetting OfflineFirstDataManager", darkColor: true);
    cacheManager.invalidateCache(entityType);
    await localSource.deleteAll();
  }

  void dispose() {
    _log("Disposing OfflineFirstDataManager", darkColor: true);
    _queueSub.cancel();
    streamController.close();
    realtimeNotifierService.stopListeningForEntity(entityType, remoteSource.table);
  }

  _log(String msg, {bool darkColor = false}) {
    EntityLogger.instance.d("DataManager", entityType.text, msg, darkColor: darkColor);
  }
}
