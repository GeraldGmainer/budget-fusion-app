import '../../enums/entity_type.dart';

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
  final EntityType entity;
  final QueueTaskType type;
  final int attempts;
  final bool done;

  QueueItem({required this.entityId, required this.entity, required this.type, required this.entityPayload, this.attempts = 0, this.done = false});

  QueueItem copyWith({String? entityId, EntityType? entity, QueueTaskType? type, String? entityPayload, int? attempts, bool? done}) {
    return QueueItem(
      entityId: entityId ?? this.entityId,
      entity: entity ?? this.entity,
      type: type ?? this.type,
      entityPayload: entityPayload ?? this.entityPayload,
      attempts: attempts ?? this.attempts,
      done: done ?? this.done,
    );
  }

  @override
  String toString() {
    return "QueueItem(entityId: $entityId, entityPayload: $entityPayload, entity: $entity, type: $type, attempts: $attempts, done: $done)";
  }
}
