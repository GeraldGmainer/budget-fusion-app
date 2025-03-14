import '../../../utils/utils.dart';

abstract class OfflineFirstEntity {
  Uuid get id;

  DateTime get updatedAt;

  OfflineFirstEntity copyWithUpdatedAt(DateTime updatedAt);
}
