import 'package:budget_fusion_app/utils/utils.dart';

abstract class OfflineFirstDto {
  Uuid get id;

  DateTime? get updatedAt;

  Map<String, dynamic> toJson();
}
