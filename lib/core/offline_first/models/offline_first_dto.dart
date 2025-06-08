import '../../value_objects/uuid.dart';

abstract class OfflineFirstDto {
  Uuid get id;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}
