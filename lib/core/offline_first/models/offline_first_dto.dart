import '../../value_objects/uuid.dart';
import 'sync_meta.dart';

abstract class OfflineFirstDto {
  Uuid get id;

  SyncMeta get syncMeta;

  Map<String, dynamic> toJson();
}
