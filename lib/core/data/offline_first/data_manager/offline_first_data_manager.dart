import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../utils/utils.dart';
import '../../../core.dart';
import '../../data_sources/data_source_adapter.dart';
import '../realtime/realtime_manager.dart';
import '../sync_manager/sync_manager.dart';

class OfflineFirstDataManager<E extends Dto> {
  final DataSourceAdapter<E> adapter;
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeManager realtimeManager;

  ReplaySubject<List<E>> streamController = ReplaySubject<List<E>>(maxSize: 1);
  Future<List<E>>? _refreshing;
  late final StreamSubscription<List<QueueItem>> _queueSub;

  OfflineFirstDataManager({
    required this.adapter,
    required this.queueManager,
    required this.syncManager,
    required this.realtimeManager,
  }) {
    queueManager.register(adapter);
    syncManager.register(this, adapter);
    realtimeManager.onEvent(adapter.remote.table, loadAll);

    _queueSub = queueManager.pendingItemsStream
        .map((items) => items.where((item) => item.entityType == adapter.type).toList())
        .distinct((prev, next) => const ListEquality<QueueItem>().equals(prev, next))
        .listen((_) async {
          final dtos = await _refreshCacheFromLocalSource();
          _emitToStream(dtos);
        });
  }

  Stream<List<E>> get stream => streamController.stream;

  Future<List<E>> loadAll({Map<String, dynamic>? filters, bool invalidateCache = false}) async {
    _log("start loadAll");
    final localDtos = await adapter.local.fetchAll();
    if (localDtos.isNotEmpty) {
      _emitToStream(localDtos, invalidateCache: invalidateCache);
      unawaited(syncManager.syncAll());
      return localDtos;
    }

    _log("No local data found. Fetching remote data ...");
    await syncManager.syncAll();
    final first = await streamController.first;
    _log("loadAll completed with ${first.length} items");
    return first;
  }

  Future<E?> loadById(String id) async {
    _log("start loadById '$id'");
    final local = await adapter.local.fetchById(id);
    if (local != null) {
      _log("Local data by id '${local.id}' found");
      return local;
    }
    _log("No local data found. Fetching remote data by id '$id' ...");

    await syncManager.syncAll();
    final local2 = await adapter.local.fetchById(id);
    if (local2 != null) {
      _log("Local data by id '${local2.id}' found");
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
    final newStatus = (existing?.syncStatus != null) ? SyncStatus.updatedLocally : SyncStatus.createdLocally;
    final newDto = (dto as dynamic).copyWith(syncStatus: newStatus);

    await adapter.local.save(newDto);

    final payload = jsonEncode(dto.toJson());
    final item = QueueItem(entityId: dto.id.value, entityType: adapter.type, taskType: QueueTaskType.upsert, entityPayload: payload);
    _log("Queuing upsert for id '${dto.id.value}'");
    unawaited(queueManager.add(item));
  }

  Future<List<E>> _refreshCacheFromLocalSource() async {
    if (_refreshing != null) {
      return await _refreshing!;
    }
    _refreshing = (() async {
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
    await adapter.local.markPendingDelete(dto.id.value);

    final dtos = await _refreshCacheFromLocalSource();
    _emitToStream(dtos);

    final item = QueueItem(entityId: dto.id.value, entityType: adapter.type, taskType: QueueTaskType.delete, entityPayload: jsonEncode(dto.toJson()));
    _log("Queuing delete for id '${dto.id.value}'");
    await queueManager.add(item);
    BudgetLogger.instance.d("queue manager done");
  }

  int? _lastEmittedFingerprint;

  void _emitToStream(List<E> dtos, {bool invalidateCache = false}) {
    // if (clearStream) streamController.add([]);   was used for forceReload
    if (invalidateCache) _lastEmittedFingerprint = null;
    final fingerprint = _calcHash(dtos);
    if (_lastEmittedFingerprint == fingerprint) return;
    _lastEmittedFingerprint = fingerprint;
    _log("Emitting ${EntityLogger.bold(dtos.length)} DTOs", darkColor: true);
    streamController.add(dtos);
  }

  int _calcHash(List<E> dtos) => Object.hashAllUnordered(dtos.map((e) => Object.hash(e.id.value, e.updatedAt?.millisecondsSinceEpoch ?? 0)));

  Future<void> reset() async {
    _log("Resetting OfflineFirstDataManager", darkColor: true);
    await adapter.local.deleteAll();
    _emitToStream(const []);
  }

  void dispose() {
    _log("Disposing OfflineFirstDataManager", darkColor: true);
    _queueSub.cancel();
    streamController.close();
    realtimeManager.dispose();
  }

  void _log(String msg, {bool darkColor = false}) {
    EntityLogger.instance.d("DataManager", adapter.type.text, msg, darkColor: darkColor);
  }
}
