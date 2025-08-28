import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../models/queue_item.dart';
import '../queue/queue_log_entry.dart';
import '../queue/queue_logger.dart';
import '../queue/queue_manager.dart';

part 'offline_first_queue_cubit.freezed.dart';
part 'offline_first_queue_state.dart';

@injectable
class OfflineFirstQueueCubit extends Cubit<OfflineFirstQueueState> {
  final QueueManager _queueManager;
  final QueueLogger _queueLogger;
  StreamSubscription<List<QueueItem>>? _itemsSub;
  StreamSubscription<List<QueueLogEntry>>? _logsSub;

  OfflineFirstQueueCubit(this._queueManager, this._queueLogger) : super(const OfflineFirstQueueState.loading()) {
    _itemsSub = _queueManager.pendingItemsStream.listen((items) async {
      state.maybeWhen(
        loaded: (_, logs) => emit(OfflineFirstQueueState.loaded(items: items, logs: logs)),
        orElse: () async {
          final logs = await _queueManager.logsSnapshot;
          emit(OfflineFirstQueueState.loaded(items: items, logs: logs));
        },
      );
    });
    _logsSub = _queueManager.logsStream.listen((logs) {
      state.maybeWhen(
        loaded: (items, _) => emit(OfflineFirstQueueState.loaded(items: items, logs: logs)),
        orElse: () {
          emit(OfflineFirstQueueState.loaded(items: _queueManager.pendingSnapshot, logs: logs));
        },
      );
    });

    _queueManager.logsSnapshot.then((logs) {
      emit(OfflineFirstQueueState.loaded(items: _queueManager.pendingSnapshot, logs: logs));
    });
  }

  Future<void> resetQueue() async {
    await _queueLogger.clearAll();
  }

  @override
  Future<void> close() async {
    await _itemsSub?.cancel();
    await _logsSub?.cancel();
    return super.close();
  }
}
