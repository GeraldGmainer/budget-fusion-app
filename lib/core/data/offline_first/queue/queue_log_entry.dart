import '../../../enums/entity_type.dart';
import '../models/queue_item.dart';

enum QueueLogEvent { added, processing, retried, succeeded, failed }

class QueueLogEntry {
  final String entityId;
  final EntityType entityType;
  final QueueTaskType taskType;
  final QueueLogEvent event;
  final int attempt;
  final DateTime at;
  final String? note;

  const QueueLogEntry({
    required this.entityId,
    required this.entityType,
    required this.taskType,
    required this.event,
    required this.attempt,
    required this.at,
    this.note,
  });
}
