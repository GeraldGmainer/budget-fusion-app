import 'package:json_annotation/json_annotation.dart';

import 'sync_status.dart';

class SyncStatusSerializer implements JsonConverter<SyncStatus, String> {
  const SyncStatusSerializer();

  @override
  SyncStatus fromJson(String json) => SyncStatus.values.firstWhere((e) => e.name == json);

  @override
  String toJson(SyncStatus object) => object.name;
}
