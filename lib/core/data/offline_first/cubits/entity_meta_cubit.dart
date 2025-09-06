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

  T? _entity;
  QueueItem? _pending;

  EntityMetaCubit({required this.repo, required this.queueManager, required this.id}) : super(const EntityMetaState.loading());

  void init() async {
    _repoSub?.cancel();
    _qSub?.cancel();

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
      _recompute();
    });
  }

  void _findEntity(List<T> list) {
    _entity = T == Category ? (list.cast<Category>()).flat().firstWhereOrNull((e) => e.id.value == id) as T? : list.firstWhereOrNull((e) => e.id.value == id);
  }

  void _findPending(List<QueueItem> pendingSnapshot) {
    _pending = pendingSnapshot.firstWhereOrNull((q) => q.entityId == id);
  }

  void _recompute() {
    if (_entity == null && _pending == null) {
      final wasDeleting = state.maybeWhen(
        upserted: (m) => m.isPendingDelete,
        error: (_, taskType) => taskType == QueueTaskType.delete,
        orElse: () => false,
      );
      if (wasDeleting) {
        emit(const EntityMetaState.deleted());
        return;
      }
      emit(const EntityMetaState.created());
      return;
    }

    if (_pending != null) {
      if (_pending!.pauseReason == QueuePauseReason.attemptsExhausted) {
        emit(EntityMetaState.error(message: _pending!.lastError ?? "unknown pending error", taskType: _pending!.taskType));
        return;
      }
    }

    final meta = EntityMeta(
      createdAt: _entity?.createdAt,
      updatedAt: _entity?.updatedAt,
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
    return super.close();
  }
}
