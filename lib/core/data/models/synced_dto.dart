import '../../value_objects/uuid.dart';
import 'dto.dart';
import 'sync_meta.dart';

class SyncedDto<T extends Dto> {
  final T dto;
  final SyncMeta syncMeta;

  const SyncedDto({required this.dto, required this.syncMeta});

  bool get isSynced => syncMeta.isSynced;

  Uuid get id => dto.id;
}
