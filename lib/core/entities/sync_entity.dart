import '../offline_first/models/sync_meta.dart';
import 'entity.dart';

abstract class SyncEntity extends Entity {
  SyncMeta get syncMeta;
}
