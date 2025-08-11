import '../value_objects/uuid.dart';

abstract class Entity {
  Uuid get id;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  DateTime? get deletedAt;
}
