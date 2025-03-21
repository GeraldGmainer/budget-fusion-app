import 'dart:async';
import 'dart:convert';

import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:collection/collection.dart';

import '../../../utils/utils.dart';
import '../../core.dart';

class OfflineFirstDataManager<LocalDto extends OfflineFirstLocalDto, RemoteDto extends OfflineFirstRemoteDto> {
  final DomainType domainType;
  final OfflineFirstLocalDataSource<LocalDto> localSource;
  final OfflineFirstRemoteDataSource<RemoteDto> remoteSource;
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final OfflineFirstAdapter<LocalDto, RemoteDto> adapter;
  final RealtimeNotifierService realtimeNotifierService;

  final StreamController<List<LocalDto>> streamController = StreamController.broadcast();
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

  Stream<List<LocalDto>> get stream => streamController.stream;

  Future<void> loadAll() async {
    _subscribeToRealtime();
    final cached = cacheManager.get<List<LocalDto>>(domainType);
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

    final remoteDtos = await remoteSource.fetchAll();
    await localSource.saveAll(remoteDtos.map((r) => adapter.toLocalDto(r)).toList());
    final stored = remoteDtos.map((r) => adapter.toLocalDto(r)).toList();
    cacheManager.set(domainType, stored);
    _emitToStream(stored);
  }

  Future<void> save(LocalDto localDto) async {
    await localSource.save(localDto);
    cacheManager.updateList(domainType, (list) {
      final oldList = list != null ? (list as List<LocalDto>) : <LocalDto>[];
      final existingIndex = oldList.indexWhere((e) => e.id == localDto.id);
      if (existingIndex >= 0) {
        final mutable = oldList.toList();
        mutable[existingIndex] = localDto;
        return mutable;
      } else {
        return [...oldList, localDto];
      }
    });
    final updatedList = cacheManager.get<List<LocalDto>>(domainType) ?? [];
    _emitToStream(updatedList);

    final payload = adapter.toRemoteDto(localDto);
    final item = QueueItem(
      id: localDto.id,
      domain: domainType,
      type: QueueTaskType.upsert,
      entityPayload: jsonEncode(payload.toJson()),
    );
    unawaited(queueManager.add(item));
  }

  Future<void> delete(LocalDto localDto) async {
    cacheManager.updateList(domainType, (list) {
      final oldList = list != null ? (list as List<LocalDto>) : <LocalDto>[];
      return oldList.whereNot((e) => e.id == localDto.id).toList();
    });
    _emitToStream(cacheManager.get<List<LocalDto>>(domainType) ?? []);

    final item = QueueItem(
      id: localDto.id,
      domain: domainType,
      type: QueueTaskType.delete,
      entityPayload: localDto.id,
    );
    unawaited(queueManager.add(item));
  }

  _emitToStream(List<LocalDto> dtos) {
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

      final updatedLocalDtos = remoteDtos.map((r) => adapter.toLocalDto(r)).toList();
      final localDtos = await localSource.fetchAll();
      final localMap = {for (final dto in localDtos) dto.id: dto};

      for (final dto in updatedLocalDtos) {
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
