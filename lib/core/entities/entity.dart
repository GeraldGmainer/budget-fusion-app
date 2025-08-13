import '../data/enums/sync_status.dart';
import '../value_objects/uuid.dart';

mixin Entity {
  Uuid get id;

  SyncStatus? get syncStatus;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  bool get isSynced => syncStatus == SyncStatus.synced;
}
