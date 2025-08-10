part of 'offline_first_queue_cubit.dart';

@freezed
class OfflineFirstQueueState with _$OfflineFirstQueueState {
  const factory OfflineFirstQueueState.initial() = _Initial;

  const factory OfflineFirstQueueState.loading() = _Loading;

  const factory OfflineFirstQueueState.loaded({
    required List<QueueItem> items,
    required List<QueueLogEntry> logs,
  }) = _Loaded;
}
