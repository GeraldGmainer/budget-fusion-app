import '../../value_objects/uuid.dart';
import '../enums/sync_status.dart';
import 'dto.dart';

class SyncedDto<T extends Dto> {
  final T dto;
  final SyncStatus status;

  const SyncedDto({required this.dto, required this.status});

  bool get isSynced => status == SyncStatus.synced;

  Uuid get id => dto.id;
}
