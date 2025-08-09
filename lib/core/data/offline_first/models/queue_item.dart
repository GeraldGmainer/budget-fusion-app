import '../../../enums/entity_type.dart';

enum QueueTaskType {
  upsert,
  delete;

  static QueueTaskType fromString(String value) {
    return QueueTaskType.values.firstWhere((e) => e.name == value, orElse: () => throw Exception("Invalid queue task type: $value"));
  }
}

class QueueItem {
  final String entityId;
  final String entityPayload;
  final EntityType entityType;
  final QueueTaskType taskType;
  final int attempts;
  final bool done;

  QueueItem({required this.entityId, required this.entityType, required this.taskType, required this.entityPayload, this.attempts = 0, this.done = false});

  QueueItem copyWith({String? entityId, EntityType? entityType, QueueTaskType? taskType, String? entityPayload, int? attempts, bool? done}) {
    return QueueItem(
      entityId: entityId ?? this.entityId,
      entityType: entityType ?? this.entityType,
      taskType: taskType ?? this.taskType,
      entityPayload: entityPayload ?? this.entityPayload,
      attempts: attempts ?? this.attempts,
      done: done ?? this.done,
    );
  }

  @override
  String toString() {
    return "QueueItem(entityId: $entityId, entityPayload: $entityPayload, entityType: $entityType, taskType: $taskType, attempts: $attempts, done: $done)";
  }
}
