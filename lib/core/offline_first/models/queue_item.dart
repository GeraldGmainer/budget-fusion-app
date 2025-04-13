import '../../enums/domain_type.dart';

enum QueueTaskType {
  upsert,
  delete;

  static QueueTaskType fromString(String value) {
    return QueueTaskType.values.firstWhere(
      (e) => e.name == value,
      orElse: () => throw Exception("Invalid queue task type: $value"),
    );
  }
}

class QueueItem {
  final String entityId;
  final String entityPayload;
  final DomainType domain;
  final QueueTaskType type;
  final int attempts;
  final bool done;

  QueueItem({
    required this.entityId,
    required this.domain,
    required this.type,
    required this.entityPayload,
    this.attempts = 0,
    this.done = false,
  });

  QueueItem copyWith({
    String? entityId,
    DomainType? domain,
    QueueTaskType? type,
    String? entityPayload,
    int? attempts,
    bool? done,
  }) {
    return QueueItem(
      entityId: entityId ?? this.entityId,
      domain: domain ?? this.domain,
      type: type ?? this.type,
      entityPayload: entityPayload ?? this.entityPayload,
      attempts: attempts ?? this.attempts,
      done: done ?? this.done,
    );
  }

  @override
  String toString() {
    return "QueueItem(entityId: $entityId, entityPayload: $entityPayload, domain: $domain, type: $type, attempts: $attempts, done: $done)";
  }
}
