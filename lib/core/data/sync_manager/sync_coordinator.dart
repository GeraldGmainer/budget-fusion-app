import 'dart:async';

import 'package:budget_fusion_app/utils/singletons/budget_logger.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';
import 'sync_manager.dart';

@singleton
class SyncCoordinator {
  final QueueManager queueManager;
  final SyncManager syncManager;
  late final StreamSubscription<Set<String>> _sub;

  /// After saving an entity, we want to sync all data. But the new entity will be returned also, causing network traffic and a new stream it
  /// It would be possible to set the entity sync cursor, but there is a risk to loose data
  /// So we exclude the new entity from the sync
  SyncCoordinator(this.queueManager, this.syncManager) {
    _sub = queueManager.drainedIds.listen((ids) {
      BudgetLogger.instance.d("drainedIds $ids");
      if (ids.isEmpty) return;
      syncManager.syncAll(excludeIds: ids);
    });
  }

  void dispose() => _sub.cancel();
}
