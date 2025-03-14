import '../../enums/domain_type.dart';

enum QueueTaskType {
  upsert,
  delete,
}

class QueueItem {
  final String id;
  final DomainType domain;
  final QueueTaskType type;
  final String entityPayload;
  final int attempts;
  final bool done;

  QueueItem({
    required this.id,
    required this.domain,
    required this.type,
    required this.entityPayload,
    this.attempts = 0,
    this.done = false,
  });

  QueueItem copyWith({
    String? id,
    DomainType? domain,
    QueueTaskType? type,
    String? entityPayload,
    int? attempts,
    bool? done,
  }) {
    return QueueItem(
      id: id ?? this.id,
      domain: domain ?? this.domain,
      type: type ?? this.type,
      entityPayload: entityPayload ?? this.entityPayload,
      attempts: attempts ?? this.attempts,
      done: done ?? this.done,
    );
  }
}
