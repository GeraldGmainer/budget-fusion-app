import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../utils/utils.dart';
import '../../core.dart';

class OfflineFirstDataManager<Dto extends OfflineFirstDto> {
  final DomainType domainType;
  final OfflineFirstLocalDataSource<Dto> localSource;
  final OfflineFirstRemoteDataSource<Dto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final RealtimeNotifierService realtimeNotifierService;
  final RemoteLoadingService remoteLoadingService;

  ReplaySubject<List<Dto>> streamController = ReplaySubject<List<Dto>>(maxSize: 1);
  bool _isRealtimeSubscribed = false;
  Future<List<Dto>>? _refreshing;

  OfflineFirstDataManager({
    required this.domainType,
    required this.localSource,
    required this.remoteSource,
    required this.cacheManager,
    required this.queueManager,
    required this.realtimeNotifierService,
    required this.remoteLoadingService,
  }) {
    queueManager.registerDomainSources(domainType, localSource, remoteSource);
  }

  Stream<List<Dto>> get stream => streamController.stream;

  Future<List<Dto>> loadAll({Map<String, dynamic>? filters}) async {
    _log("start loadAll for $coloredDomain");
    _subscribeToRealtime();
    final cached = cacheManager.get<List<Dto>>(domainType);
    if (cached != null && cached.isNotEmpty) {
      _log("Using cached data with ${cached.length} items for domain $coloredDomain");
      _emitToStream(cached);
      unawaited(_syncPartial());
      return cached;
    }

    _log("Fetching local data for domain $coloredDomain...");
    final localDtos = await localSource.fetchAll();
    if (localDtos.isNotEmpty) {
      _log("Local ${localDtos.length} items found for domain $coloredDomain");
      cacheManager.set(domainType, localDtos);
      _emitToStream(localDtos);
      unawaited(_syncPartial());
      return localDtos;
    }

    _log("No local data found. Fetching remote data for domain $coloredDomain...");
    final dtos = await remoteLoadingService.wrap(() => remoteSource.fetchAll());
    await localSource.saveAll(dtos);
    cacheManager.set(domainType, dtos);
    _emitToStream(dtos);
    _log("loadAll completed for domain $coloredDomain");
    return dtos;
  }

  Future<Dto?> loadById(String id) async {
    _log("start loadById '$id' for $coloredDomain");
    _subscribeToRealtime();
    final cached = cacheManager.get<List<Dto>>(domainType);
    if (cached != null) {
      final found = cached.firstWhereOrNull((e) => e.id.value == id);
      if (found != null) {
        _log("Using cached data with ID '${found.id}' for domain $coloredDomain");
        return found;
      }
    }
    _log("Fetching local data by id for domain $coloredDomain...");
    final local = await localSource.fetchById(id);
    if (local != null) {
      _log("Local data by id '${local.id}' found for domain $coloredDomain");
      return local;
    }
    _log("No local data found. Fetching remote data by id '$id' for domain $coloredDomain...");
    final remote = await remoteLoadingService.wrap(() => remoteSource.fetchById(id));
    if (remote != null) {
      _log("Remote data by id '${remote.id}' found for domain $coloredDomain");
      await localSource.save(remote);
      final refreshedDtos = await _refreshCacheFromLocalSource();
      _emitToStream(refreshedDtos);
      return remote;
    }
    return null;
  }

  Future<void> save(Dto dto) async {
    _log("Saving DTO with id '${dto.id.value}' for domain $coloredDomain");

    await localSource.save(dto);
    final refreshedDtos = await _refreshCacheFromLocalSource();
    _emitToStream(refreshedDtos);

    final item = QueueItem(
      entityId: dto.id.value,
      domain: domainType,
      type: QueueTaskType.upsert,
      entityPayload: jsonEncode(dto.toJson()),
    );
    _log("Queuing upsert for id '${dto.id.value}' for domain $coloredDomain");
    unawaited(queueManager.add(item));
  }

  Future<List<Dto>> _refreshCacheFromLocalSource() async {
    if (_refreshing != null) {
      return await _refreshing!;
    }
    _refreshing = (() async {
      final dtos = await localSource.fetchAll();
      cacheManager.set(domainType, dtos);
      return dtos;
    })();
    try {
      return await _refreshing!;
    } finally {
      _refreshing = null;
    }
  }

  Future<void> delete(Dto dto) async {
    _log("Deleting DTO with id '${dto.id.value}' for domain $coloredDomain");
    await localSource.deleteById(dto.id.value);

    final dtos = await _refreshCacheFromLocalSource();
    _emitToStream(dtos);

    final item = QueueItem(
      entityId: dto.id.value,
      domain: domainType,
      type: QueueTaskType.delete,
      entityPayload: jsonEncode(dto.toJson()),
    );
    _log("Queuing delete for id '${dto.id.value}' for domain $coloredDomain");
    unawaited(queueManager.add(item));
  }

  _emitToStream(List<Dto> dtos) {
    _log("Emitting ${dtos.length} entities for $coloredDomain", darkColor: true);
    streamController.add(dtos);
  }

  void _subscribeToRealtime() {
    if (_isRealtimeSubscribed) return;
    _isRealtimeSubscribed = true;
    realtimeNotifierService.startListeningForDomain(domainType, remoteSource.table);
  }

  Future<void> _syncPartial() async {
    _log("Starting partial sync for domain $coloredDomain");
    try {
      final localMax = await localSource.fetchMaxUpdatedAt();
      final remoteDtos = await remoteLoadingService.wrap(() => remoteSource.fetchAllNewer(localMax));
      if (remoteDtos.isEmpty) {
        _log("No new remote data found during sync for domain $coloredDomain", darkColor: true);
        return;
      }

      _log("Fetched ${remoteDtos.length} new remote items for domain $coloredDomain");
      final localDtos = await localSource.fetchAll();
      final localMap = {for (final dto in localDtos) dto.id: dto};

      for (final dto in remoteDtos) {
        if (!localMap.containsKey(dto.id)) {
          localMap[dto.id] = dto;
        } else {
          final existing = localMap[dto.id]!;
          if (existing.updatedAt == null || (dto.updatedAt != null && existing.updatedAt!.isBefore(dto.updatedAt!))) {
            localMap[dto.id] = dto;
          }
        }
      }
      final mergedList = localMap.values.toList();
      await localSource.saveAll(mergedList);
      final refreshedDtos = await _refreshCacheFromLocalSource();
      _emitToStream(refreshedDtos);
      _log("Partial sync completed successfully for domain $coloredDomain");
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Sync failed", e, stackTrace);
    }
  }

  Future<void> reset() async {
    _log("Resetting OfflineFirstDataManager for domain $coloredDomain", darkColor: true);
    cacheManager.invalidateCache(domainType);
    await localSource.deleteAll();
  }

  void dispose() {
    _log("Disposing OfflineFirstDataManager for domain $coloredDomain", darkColor: true);
    streamController.close();
    realtimeNotifierService.stopListeningForDomain(domainType);
  }

  _log(String msg, {bool darkColor = false}) {
    DomainLogger.instance.d("DataManager", msg, darkColor: darkColor);
  }

  String get coloredDomain => DomainLogger.applyColor(domainType.name);
}
