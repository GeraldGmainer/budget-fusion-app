import '../../value_objects/uuid.dart';
import '../enums/sync_status.dart';

abstract class Dto {
  Uuid get id;

  SyncStatus? get syncStatus;

  DateTime? get createdAt;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}

extension DtoListX<T extends Dto> on List<T> {
  List<T> withoutPendingDelete() {
    return where((dto) => dto.syncStatus != SyncStatus.pendingDelete).toList();
  }
}
