import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:collection/collection.dart';

import '../../../utils/utils.dart';
import '../../core.dart';

class OfflineFirstDataManager<Entity extends OfflineFirstEntity, LocalDto extends OfflineFirstLocalDto, RemoteDto extends OfflineFirstRemoteDto> {
  final DomainType domainType;
  final OfflineFirstLocalDataSource<Entity, LocalDto> localSource;
  final OfflineFirstRemoteDataSource<Entity, RemoteDto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final OfflineFirstAdapter<Entity, LocalDto, RemoteDto> adapter;
  final RealtimeNotifierService realtimeNotifierService;

  final StreamController<List<Entity>> streamController = StreamController.broadcast();
  bool _isRealtimeSubscribed = false;

  OfflineFirstDataManager({
    required this.domainType,
    required this.localSource,
    required this.remoteSource,
    required this.cacheManager,
    required this.queueManager,
    required this.adapter,
    required this.realtimeNotifierService,
  });

  Stream<List<Entity>> get stream => streamController.stream;

  Future<void> loadAll() async {
    _subscribeToRealtime();
    final cached = cacheManager.get<List<Entity>>(domainType);
    if (cached != null && cached.isNotEmpty) {
      streamController.add(cached);
      unawaited(_syncPartial());
      return;
    }

    final localDtos = await localSource.fetchAll();
    if (localDtos.isNotEmpty) {
      final entities = localDtos.map(adapter.fromLocalDto).toList();
      cacheManager.set(domainType, entities);
      streamController.add(entities);
      unawaited(_syncPartial());
      return;
    }

    final remoteDtos = await remoteSource.fetchAll();
    final entities = remoteDtos.map(adapter.fromRemoteDto).toList();
    await localSource.saveAll(entities.map(adapter.toLocalDto).toList());
    cacheManager.set(domainType, entities);
    streamController.add(entities);
  }

  Future<void> save(Entity entity) async {
    await localSource.save(adapter.toLocalDto(entity));
    cacheManager.updateList(domainType, (list) {
      final List<Entity> oldList = list != null ? (list as List<Entity>) : <Entity>[];
      final existingIndex = oldList.indexWhere((e) => e.id == entity.id);
      if (existingIndex >= 0) {
        final mutable = oldList.toList();
        mutable[existingIndex] = entity;
        return mutable;
      } else {
        return [...oldList, entity];
      }
    });
    final updatedList = cacheManager.get<List<Entity>>(domainType) ?? [];
    streamController.add(updatedList);

    final payload = adapter.toRemoteDto(entity);
    final item = QueueItem(id: entity.id.toJson(), domain: domainType, type: QueueTaskType.upsert, entityPayload: jsonEncode(payload.toJson()));
    unawaited(queueManager.add(item));
  }

  Future<void> delete(Entity entity) async {
    cacheManager.updateList(domainType, (list) {
      final oldList = list != null ? (list as List<Entity>) : <Entity>[];
      return oldList.whereNot((e) => e.id == entity.id).toList();
    });
    streamController.add(cacheManager.get<List<Entity>>(domainType) ?? []);

    final item = QueueItem(id: entity.id.toJson(), domain: domainType, type: QueueTaskType.delete, entityPayload: entity.id.toJson());
    unawaited(queueManager.add(item));
  }

  void _subscribeToRealtime() {
    if (_isRealtimeSubscribed) return;
    _isRealtimeSubscribed = true;

    realtimeNotifierService.startListeningForDomain(domainType, remoteSource.table);
  }

  Future<void> _syncPartial() async {
    try {
      final localMax = await localSource.fetchMaxUpdatedAt();
      // TODO maybe store last sync datetime somewhere in local preferences
      final remoteDtos = await remoteSource.fetchAllNewer(localMax);

      if (remoteDtos.isEmpty) return;

      final updatedEntities = remoteDtos.map(adapter.fromRemoteDto).toList();
      final localDtos = await localSource.fetchAll();
      final localMap = {
        for (final dto in localDtos) dto.id: dto,
      };

      for (final entity in updatedEntities) {
        final id = entity.id.value;
        final localDto = localMap[id];
        if (localDto == null) {
          localMap[id] = adapter.toLocalDto(entity);
        } else {
          if (localDto.updatedAt == null || (localDto.updatedAt!.isBefore(entity.updatedAt))) {
            localMap[id] = adapter.toLocalDto(entity);
          }
        }
      }
      final mergedList = localMap.values.toList();
      await localSource.saveAll(mergedList);

      final entities = mergedList.map(adapter.fromLocalDto).toList();
      cacheManager.set(domainType, entities);
      streamController.add(entities);
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Sync failed", e, stackTrace);
    }
  }

  void dispose() {
    streamController.close();
  }
}
