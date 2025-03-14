import '../../../utils/utils.dart';

abstract class OfflineFirstRemoteDto {
  Uuid get id;

  DateTime get updatedAt;

  Map<String, dynamic> toJson();
}
