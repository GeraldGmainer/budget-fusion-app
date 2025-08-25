import '../../../enums/entity_type.dart';
import '../enums/queue_pause_reason.dart';
import '../enums/queue_task_type.dart';

enum QueueLogEvent { added, processing, retried, succeeded, failed }

class QueueLogEntry {
  final String entityId;
  final EntityType entityType;
  final QueueTaskType taskType;
  final QueueLogEvent event;
  final int attempt;
  final DateTime at;
  final String? note;
  final QueuePauseReason? pauseReason;

  const QueueLogEntry({
    required this.entityId,
    required this.entityType,
    required this.taskType,
    required this.event,
    required this.attempt,
    required this.at,
    this.note,
    this.pauseReason,
  });
}
