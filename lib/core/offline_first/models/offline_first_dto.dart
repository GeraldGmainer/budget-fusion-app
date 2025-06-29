import '../../value_objects/uuid.dart';
import 'sync_meta.dart';

abstract class OfflineFirstDto {
  Uuid get id;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}
