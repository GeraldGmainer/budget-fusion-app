import '../../value_objects/uuid.dart';

abstract class Dto {
  Uuid get id;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  DateTime? get deletedAt;

  Map<String, dynamic> toJson();
}
