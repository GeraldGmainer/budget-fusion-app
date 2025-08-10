import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';
import '../../data_sources/data_source_adapter.dart';
import '../../sync_manager/sync_manager.dart';
import '../models/queue_item.dart';
import '../realtime/realtime_notifier_service.dart';

class OfflineFirstDataManager<E extends Dto> {
  final DataSourceAdapter<E> adapter;
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeNotifierService realtimeNotifierService;

  ReplaySubject<List<SyncedDto<E>>> streamController = ReplaySubject<List<SyncedDto<E>>>(maxSize: 1);
  bool _isRealtimeSubscribed = false;
  Future<List<SyncedDto<E>>>? _refreshing;
  late final StreamSubscription<List<QueueItem>> _queueSub;

  OfflineFirstDataManager({
    required this.adapter,
    required this.queueManager,
    required this.syncManager,
    required this.realtimeNotifierService,
  }) {
    queueManager.register(adapter);
    syncManager.register(this, adapter);

    _queueSub = queueManager.pendingItemsStream
        .map((items) => items.where((item) => item.entityType == adapter.type).toList())
        .distinct((prev, next) => const ListEquality<QueueItem>().equals(prev, next))
        .listen((_) async {
          final dtos = await _refreshCacheFromLocalSource();
          _emitToStream(dtos);
        });
  }

  Stream<List<SyncedDto<E>>> get stream => streamController.stream;

  Future<List<SyncedDto<E>>> loadAll({Map<String, dynamic>? filters}) async {
    _log("start loadAll");
    _subscribeToRealtime();

    final localDtos = await adapter.local.fetchAll();
    if (localDtos.isNotEmpty) {
      _log("Local ${EntityLogger.bold(localDtos.length)} items found");
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

  Future<SyncedDto<E>?> loadById(String id) async {
    _log("start loadById '$id'");
    _subscribeToRealtime();
    final local = await adapter.local.fetchById(id);
    if (local != null) {
      _log("Local data by id '${local.dto.id}' found");
      return local;
    }
    _log("No local data found. Fetching remote data by id '$id' ...");

    await syncManager.syncAll();
    final local2 = await adapter.local.fetchById(id);
    if (local2 != null) {
      _log("Local data by id '${local2.dto.id}' found");
      return local2;
    }
    _log("No local data found after syncAll for ID '$id' ...");
    return null;
  }

  Future<void> refresh() async {
    _log("Refreshing local data ...");
    final localDtos = await adapter.local.fetchAll();
    _emitToStream(localDtos);
  }

  Future<void> save(E dto) async {
    _log("Saving DTO with id '${dto.id.value}'");
    final existing = await adapter.local.fetchById(dto.id.value);
    final newMeta = (existing?.syncMeta != null) ? existing!.syncMeta.copyWith(status: SyncStatus.updatedLocally) : SyncMeta(status: SyncStatus.createdLocally);
    final wrapped = SyncedDto<E>(dto: dto, syncMeta: newMeta);

    await adapter.local.save(wrapped);

    final payload = jsonEncode(dto.toJson());
    final item = QueueItem(entityId: dto.id.value, entityType: adapter.type, taskType: QueueTaskType.upsert, entityPayload: payload);
    _log("Queuing upsert for id '${dto.id.value}'");
    unawaited(queueManager.add(item));
  }

  Future<List<SyncedDto<E>>> _refreshCacheFromLocalSource() async {
    if (_refreshing != null) {
      return await _refreshing!;
    }
    _refreshing =
        (() async {
          final dtos = await adapter.local.fetchAll();
          return dtos;
        })();
    try {
      return await _refreshing!;
    } finally {
      _refreshing = null;
    }
  }

  Future<void> delete(E dto) async {
    _log("Deleting DTO with id '${dto.id.value}'");
    await adapter.local.deleteById(dto.id.value);

    final dtos = await _refreshCacheFromLocalSource();
    _emitToStream(dtos);

    final item = QueueItem(entityId: dto.id.value, entityType: adapter.type, taskType: QueueTaskType.delete, entityPayload: jsonEncode(dto.toJson()));
    _log("Queuing delete for id '${dto.id.value}'");
    unawaited(queueManager.add(item));
  }

  _emitToStream(List<SyncedDto<E>> dtos) {
    _log("Emitting ${EntityLogger.bold(dtos.length)} DTOs", darkColor: true);
    streamController.add(dtos);
  }

  void _subscribeToRealtime() {
    if (_isRealtimeSubscribed || !adapter.type.realtimeEnabled) return;
    _isRealtimeSubscribed = true;
    realtimeNotifierService.startListeningForEntity(adapter.type, adapter.remote.table);
  }

  Future<void> reset() async {
    _log("Resetting OfflineFirstDataManager", darkColor: true);
    await adapter.local.deleteAll();
  }

  void dispose() {
    _log("Disposing OfflineFirstDataManager", darkColor: true);
    _queueSub.cancel();
    streamController.close();
    realtimeNotifierService.stopListeningForEntity(adapter.type, adapter.remote.table);
  }

  _log(String msg, {bool darkColor = false}) {
    EntityLogger.instance.d("DataManager", adapter.type.text, msg, darkColor: darkColor);
  }
}
