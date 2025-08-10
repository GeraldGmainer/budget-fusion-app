import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../models/queue_item.dart';
import '../queue/queue_manager.dart';

part 'offline_first_queue_cubit.freezed.dart';
part 'offline_first_queue_state.dart';

@injectable
class OfflineFirstQueueCubit extends Cubit<OfflineFirstQueueState> {
  final QueueManager _queueManager;
  StreamSubscription<List<QueueItem>>? _itemsSub;
  StreamSubscription<List<QueueLogEntry>>? _logsSub;

  OfflineFirstQueueCubit(this._queueManager) : super(const OfflineFirstQueueState.loading()) {
    _itemsSub = _queueManager.pendingItemsStream.listen((items) {
      final logs = state.maybeWhen(loaded: (_, l) => l, orElse: () => _queueManager.logsSnapshot);
      emit(OfflineFirstQueueState.loaded(items: items, logs: logs));
    });
    _logsSub = _queueManager.logsStream.listen((logs) {
      final items = state.maybeWhen(loaded: (i, _) => i, orElse: () => _queueManager.pendingSnapshot);
      emit(OfflineFirstQueueState.loaded(items: items, logs: logs));
    });

    emit(OfflineFirstQueueState.loaded(items: _queueManager.pendingSnapshot, logs: _queueManager.logsSnapshot));
  }

  @override
  Future<void> close() async {
    await _itemsSub?.cancel();
    await _logsSub?.cancel();
    return super.close();
  }
}
