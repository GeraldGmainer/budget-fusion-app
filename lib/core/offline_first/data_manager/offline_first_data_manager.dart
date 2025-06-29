import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/utils.dart';
import '../../core.dart';

class OfflineFirstDataManager<Dto extends OfflineFirstDto> {
  final EntityType entityType;
  final OfflineFirstLocalDataSource<Dto> localSource;
  final OfflineFirstRemoteDataSource<Dto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
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
    required this.realtimeNotifierService,
    required this.remoteLoadingService,
  }) {
    queueManager.registerEntitySources(entityType, localSource, remoteSource);

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
      unawaited(_syncPartial());
      return cached;
    }

    _log("Fetching local data ...");
    final localDtos = await localSource.fetchAll();
    if (localDtos.isNotEmpty) {
      _log("Local ${EntityLogger.bold(localDtos.length)} items found");
      cacheManager.set(entityType, localDtos);
      _emitToStream(localDtos);
      unawaited(_syncPartial());
      return localDtos;
    }

    _log("No local data found. Fetching remote data ...");
    final remoteDtos = await remoteLoadingService.wrap(() => remoteSource.fetchAll());
    await localSource.saveAllNotSynced(remoteDtos);
    final synced = await _refreshCacheFromLocalSource();
    cacheManager.set(entityType, synced);
    _emitToStream(synced);
    _log("loadAll completed");
    return synced;
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
    final remote = await remoteLoadingService.wrap(() => remoteSource.fetchById(id));
    if (remote != null) {
      _log("Remote data by id '${remote.id}' found");
      await localSource.saveNotSynced(remote);
      final refreshedDtos = await _refreshCacheFromLocalSource();
      _emitToStream(refreshedDtos);
      return refreshedDtos.firstWhereOrNull((e) => e.dto.id.value == id);
    }
    return null;
  }

  // Future<void> save(Dto dto) async {
  //   _log("Saving DTO with id '${dto.id.value}'");
  //
  //   await localSource.save(dto);
  //   final refreshedDtos = await _refreshCacheFromLocalSource();
  //   _emitToStream(refreshedDtos);
  //
  //   final item = QueueItem(entityId: dto.id.value, entityType: entityType, taskType: QueueTaskType.upsert, entityPayload: jsonEncode(dto.toJson()));
  //   _log("Queuing upsert for id '${dto.id.value}'");
  //   unawaited(queueManager.add(item));
  // }

  Future<void> save(Dto dto) async {
    _log("Saving DTO with id '${dto.id.value}'");
    final now = DateTime.now();
    final existing = await localSource.fetchById(dto.id.value);
    // TODO set modifiedLocallyAt and lastSyncedAt correctly
    final newMeta =
        (existing?.syncMeta != null)
            ? existing!.syncMeta.copyWith(status: SyncStatus.updatedLocally, modifiedLocallyAt: now)
            : SyncMeta(status: SyncStatus.createdLocally, modifiedLocallyAt: now, lastSyncedAt: now);
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

  Future<void> _syncPartial() async {
    _log("Starting partial sync");
    try {
      final localMax = await localSource.fetchMaxUpdatedAt();
      final remoteDtos = await remoteLoadingService.wrap(() => remoteSource.fetchAllNewer(localMax));
      if (remoteDtos.isEmpty) {
        _log("No new remote data found during sync", darkColor: true);
        return;
      }

      _log("Fetched ${remoteDtos.length} new remote items");
      final localSyncedDtos = await localSource.fetchAll();
      final localMap = {for (final syncedDto in localSyncedDtos) syncedDto.dto.id: syncedDto};
      final now = DateTime.now();

      // final newMeta =
      // (existing?.syncMeta != null)
      //     ? existing!.syncMeta.copyWith(status: SyncStatus.updatedLocally, modifiedLocallyAt: now)
      //     : SyncMeta(status: SyncStatus.createdLocally, modifiedLocallyAt: now);
      // final wrapped = SyncedDto<Dto>(dto: dto, syncMeta: newMeta);

      for (final dto in remoteDtos) {
        if (!localMap.containsKey(dto.id)) {
          // TODO set modifiedLocallyAt and lastSyncedAt correctly
          final meta = SyncMeta(status: SyncStatus.createdLocally, modifiedLocallyAt: now, lastSyncedAt: now);
          localMap[dto.id] = SyncedDto<Dto>(dto: dto, syncMeta: meta);
        } else {
          final existing = localMap[dto.id]!;
          if (existing.dto.updatedAt == null || (dto.updatedAt != null && existing.dto.updatedAt!.isBefore(dto.updatedAt!))) {
            // TODO set modifiedLocallyAt and lastSyncedAt correctly
            final meta = existing.syncMeta.copyWith(status: SyncStatus.updatedLocally, modifiedLocallyAt: now, lastSyncedAt: now);
            localMap[dto.id] = SyncedDto<Dto>(dto: dto, syncMeta: meta);
          }
        }
      }
      final mergedList = localMap.values.toList();
      await localSource.saveAll(mergedList);
      final refreshedDtos = await _refreshCacheFromLocalSource();
      _emitToStream(refreshedDtos);
      _log("Partial sync completed successfully");
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Sync failed", e, stackTrace);
    }
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
