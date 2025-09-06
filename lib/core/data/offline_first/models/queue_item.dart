import '../../../enums/entity_type.dart';
import '../enums/queue_pause_reason.dart';
import '../enums/queue_task_type.dart';

class QueueItem {
  final String entityId;
  final String entityPayload;
  final EntityType entityType;
  final QueueTaskType taskType;
  final int attempts;
  final bool done;
  final QueuePauseReason? pauseReason;
  final String? lastError;
  final DateTime? lastErrorAt;

  QueueItem({
    required this.entityId,
    required this.entityType,
    required this.taskType,
    required this.entityPayload,
    this.attempts = 0,
    this.done = false,
    this.pauseReason,
    this.lastError,
    this.lastErrorAt,
  });

  QueueItem copyWith({
    String? entityId,
    EntityType? entityType,
    QueueTaskType? taskType,
    String? entityPayload,
    int? attempts,
    bool? done,
    QueuePauseReason? pausedReason,
    String? lastError,
    DateTime? lastErrorAt,
  }) {
    return QueueItem(
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      taskType: taskType ?? this.taskType,
      entityPayload: entityPayload ?? this.entityPayload,
      attempts: attempts ?? this.attempts,
      done: done ?? this.done,
      pauseReason: pausedReason,
      lastError: lastError,
      lastErrorAt: lastErrorAt,
    );
  }

  QueueItem resetError() {
    return copyWith(attempts: 0, pausedReason: null, lastError: null, lastErrorAt: null);
  }

  @override
  String toString() {
    return "QueueItem(entityId: $entityId, entityPayload: $entityPayload, entityType: $entityType, taskType: $taskType, attempts: $attempts, done: $done, pausedReason: $pauseReason, error: $lastError, errorAt: $lastErrorAt)";
  }
}
