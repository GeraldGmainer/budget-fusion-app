import '../../entities/base/uuid.dart';

abstract class OfflineFirstDto {
  Uuid get id;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}
