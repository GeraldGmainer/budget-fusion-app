import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../repos/category/category.dart';
import '../../../core.dart';
import '../models/entity_meta.dart';

part 'entity_meta_cubit.freezed.dart';
part 'entity_meta_state.dart';

class EntityMetaCubit<T extends Entity> extends Cubit<EntityMetaState> {
  final Repo<T> repo;
  final QueueManager queueManager;
  final String id;

  StreamSubscription<List<T>>? _repoSub;
  StreamSubscription<List<QueueItem>>? _qSub;
  StreamSubscription<List<QueueLogEntry>>? _logSub;

  T? _entity;
  QueueItem? _pending;
  bool? _failed = false;

  EntityMetaCubit({required this.repo, required this.queueManager, required this.id}) : super(const EntityMetaState.loading());

  void init() {
    _repoSub?.cancel();
    _qSub?.cancel();
    _logSub?.cancel();

    _findPending(queueManager.pendingSnapshot);
    _findFailed(queueManager.logsSnapshot);
    _recompute();

    unawaited(
      repo.getAll().then((list) {
        _findEntity(list);
        _recompute();
      }),
    );

    _repoSub = repo.watch().listen((list) {
      _findEntity(list);
      _recompute();
    });

    _qSub = queueManager.pendingItemsStream.listen((items) {
      _pending = items.where((q) => q.entityId == id).cast<QueueItem?>().fold<QueueItem?>(null, (prev, e) => e);
      _recompute();
    });

    _logSub = queueManager.logsStream.listen((logs) {
      final last = logs.firstWhereOrNull((l) => l.entityId == id && (l.event == QueueLogEvent.failed));
      _failed = last != null;
      _recompute();
    });
  }

  void _findEntity(List<T> list) {
    _entity = T == Category ? (list.cast<Category>()).flat().firstWhereOrNull((e) => e.id.value == id) as T? : list.firstWhereOrNull((e) => e.id.value == id);
  }

  void _findPending(List<QueueItem> pendingSnapshot) {
    _pending = pendingSnapshot.firstWhereOrNull((q) => q.entityId == id);
  }

  void _findFailed(List<QueueLogEntry> logsSnapshot) {
    _failed = logsSnapshot.any((l) => l.entityId == id && l.event == QueueLogEvent.failed);
  }

  void _recompute() {
    final e = _entity;
    if (e == null && _pending == null) {
      emit(const EntityMetaState.created());
      return;
    }
    if (e != null && e.deletedAt != null) {
      emit(EntityMetaState.deleted(e.deletedAt));
      return;
    }
    final meta = EntityMeta(
      createdAt: e?.createdAt,
      updatedAt: e?.updatedAt,
      deletedAt: e?.deletedAt,
      isPending: _pending != null,
      isFailed: _failed ?? false,
      attempts: _pending?.attempts ?? 0,
    );
    emit(EntityMetaState.upserted(meta));
  }

  @override
  Future<void> close() async {
    await _repoSub?.cancel();
    await _qSub?.cancel();
    await _logSub?.cancel();
    return super.close();
  }
}
