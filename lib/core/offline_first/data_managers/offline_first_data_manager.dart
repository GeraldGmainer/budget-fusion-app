import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:collection/collection.dart';

import '../../../utils/utils.dart';
import '../../core.dart';

class OfflineFirstDataManager<Dto extends OfflineFirstDto> {
  final DomainType domainType;
  final OfflineFirstLocalDataSource<Dto> localSource;
  final OfflineFirstRemoteDataSource<Dto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final RealtimeNotifierService realtimeNotifierService;

  final StreamController<List<Dto>> streamController = StreamController.broadcast();
  bool _isRealtimeSubscribed = false;

  OfflineFirstDataManager({
    required this.domainType,
    required this.localSource,
    required this.remoteSource,
    required this.cacheManager,
    required this.queueManager,
    required this.realtimeNotifierService,
  });

  Stream<List<Dto>> get stream => streamController.stream;

  Future<void> loadAll({Map<String, dynamic>? filters}) async {
    _subscribeToRealtime();
    final cached = cacheManager.get<List<Dto>>(domainType);
    if (cached != null && cached.isNotEmpty) {
      _emitToStream(cached);
      unawaited(_syncPartial());
      return;
    }

    final localDtos = await localSource.fetchAll();
    if (localDtos.isNotEmpty) {
      cacheManager.set(domainType, localDtos);
      _emitToStream(localDtos);
      unawaited(_syncPartial());
      return;
    }

    final dtos = await remoteSource.fetchAll();
    await localSource.saveAll(dtos);
    cacheManager.set(domainType, dtos);
    _emitToStream(dtos);
  }

  Future<void> save(Dto dto) async {
    await localSource.save(dto);
    cacheManager.updateList(domainType, (list) {
      final oldList = list != null ? (list as List<Dto>) : <Dto>[];
      final existingIndex = oldList.indexWhere((e) => e.id == dto.id);
      if (existingIndex >= 0) {
        final mutable = oldList.toList();
        mutable[existingIndex] = dto;
        return mutable;
      } else {
        return [...oldList, dto];
      }
    });
    final updatedList = cacheManager.get<List<Dto>>(domainType) ?? [];
    _emitToStream(updatedList);

    final item = QueueItem(
      entityId: dto.id.value,
      domain: domainType,
      type: QueueTaskType.upsert,
      entityPayload: jsonEncode(dto.toJson()),
    );
    unawaited(queueManager.add(item));
  }

  Future<void> delete(Dto dto) async {
    cacheManager.updateList(domainType, (list) {
      final oldList = list != null ? (list as List<Dto>) : <Dto>[];
      return oldList.whereNot((e) => e.id == dto.id).toList();
    });
    _emitToStream(cacheManager.get<List<Dto>>(domainType) ?? []);

    final item = QueueItem(entityId: dto.id.value, domain: domainType, type: QueueTaskType.delete, entityPayload: dto.id.value);
    unawaited(queueManager.add(item));
  }

  _emitToStream(List<Dto> dtos) {
    streamController.add(dtos);
  }

  void _subscribeToRealtime() {
    if (_isRealtimeSubscribed) return;
    _isRealtimeSubscribed = true;
    realtimeNotifierService.startListeningForDomain(domainType, remoteSource.table);
  }

  Future<void> _syncPartial() async {
    try {
      final localMax = await localSource.fetchMaxUpdatedAt();
      final remoteDtos = await remoteSource.fetchAllNewer(localMax);
      if (remoteDtos.isEmpty) return;

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
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Sync failed", e, stackTrace);
    }
  }

  void dispose() {
    streamController.close();
  }
}
