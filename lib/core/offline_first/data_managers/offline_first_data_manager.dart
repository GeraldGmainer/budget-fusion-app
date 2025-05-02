import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
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

  Future<void> save(Dto dto) async {
    _log("Saving DTO with id '${dto.id.value}' for domain $coloredDomain");

    await localSource.save(dto);
    await cacheManager.updateList<Dto>(domainType, (list) async {
      List<Dto> base = list ?? await _getCachedOrLoad();
      final idx = base.indexWhere((e) => e.id == dto.id);
      final newList = [...base];
      if (idx >= 0) {
        newList[idx] = dto;
      } else {
        newList.add(dto);
      }
      return newList;
    });
    final updatedList = cacheManager.get<List<Dto>>(domainType) ?? [];
    _emitToStream(updatedList);

    final item = QueueItem(
      entityId: dto.id.value,
      domain: domainType,
      type: QueueTaskType.upsert,
      entityPayload: jsonEncode(dto.toJson()),
    );
    _log("Queuing upsert for id '${dto.id.value}' for domain $coloredDomain");
    unawaited(queueManager.add(item));
  }

  Future<List<Dto>> _getCachedOrLoad() async {
    var list = cacheManager.get<List<Dto>>(domainType);
    if (list != null && list.isNotEmpty) {
      return list;
    }
    _log("Fetching local data for domain $coloredDomain...");
    var local = await localSource.fetchAll();
    _log("Local ${local.length} items found for domain $coloredDomain");
    if (local.isNotEmpty) {
      cacheManager.set(domainType, local);
      return local;
    }
    _log("No local data found. Fetching remote data for domain $coloredDomain...");
    var remote = await remoteLoadingService.wrap(() => remoteSource.fetchAll());
    _log("Remote ${local.length} items found for domain $coloredDomain");
    await localSource.saveAll(remote);
    cacheManager.set(domainType, remote);
    return remote;
  }

  Future<void> delete(Dto dto) async {
    _log("Deleting DTO with id '${dto.id.value}' for domain $coloredDomain");
    await localSource.deleteById(dto.id.value);

    final dtos = await localSource.fetchAll();
    cacheManager.set(domainType, dtos);
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
      cacheManager.set(domainType, mergedList);
      _emitToStream(mergedList);
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
  }

  _log(String msg, {bool darkColor = false}) {
    DomainLogger.instance.d("DataManager", msg, darkColor: darkColor);
  }

  String get coloredDomain => DomainLogger.applyColor(domainType.name);
}
