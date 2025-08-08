import '../../value_objects/uuid.dart';

abstract class Dto {
  Uuid get id;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}
