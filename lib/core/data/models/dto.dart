import '../../value_objects/uuid.dart';
import '../enums/sync_status.dart';

abstract class Dto {
  Uuid get id;

  SyncStatus? get syncStatus;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  DateTime? get deletedAt;

  Map<String, dynamic> toJson();
}
