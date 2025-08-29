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
  bool _wasPendingDelete = false;

  EntityMetaCubit({required this.repo, required this.queueManager, required this.id}) : super(const EntityMetaState.loading());

  void init() async {
    _repoSub?.cancel();
    _qSub?.cancel();
    _logSub?.cancel();

    _findPending(queueManager.pendingSnapshot);

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
      if (_pending?.taskType == QueueTaskType.delete) _wasPendingDelete = true;
      _recompute();
    });
  }

  void _findEntity(List<T> list) {
    _entity = T == Category ? (list.cast<Category>()).flat().firstWhereOrNull((e) => e.id.value == id) as T? : list.firstWhereOrNull((e) => e.id.value == id);
  }

  void _findPending(List<QueueItem> pendingSnapshot) {
    _pending = pendingSnapshot.firstWhereOrNull((q) => q.entityId == id);
    if (_pending?.taskType == QueueTaskType.delete) _wasPendingDelete = true;
  }

  void _recompute() {
    final e = _entity;
    if (e == null && _pending == null && _wasPendingDelete) {
      emit(EntityMetaState.deleted());
      return;
    }
    if (e == null && _pending == null) {
      emit(const EntityMetaState.created());
      return;
    }
    final meta = EntityMeta(
      createdAt: e?.createdAt,
      updatedAt: e?.updatedAt,
      isPending: _pending != null,
      isPendingDelete: _pending?.taskType == QueueTaskType.delete,
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
