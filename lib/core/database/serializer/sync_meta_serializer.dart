import 'package:json_annotation/json_annotation.dart';

import '../../core.dart';

class SyncMetaSerializer implements JsonConverter<SyncMeta, dynamic> {
  const SyncMetaSerializer();

  @override
  SyncMeta fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final statusString = json['sync_status'] as String? ?? 'synced';
      final status = SyncStatus.values.firstWhere((e) => e.toString().split('.').last == statusString, orElse: () => SyncStatus.synced);
      return SyncMeta(status: status);
    }
    throw FormatException('Cannot convert $json to SyncMeta');
  }

  @override
  dynamic toJson(SyncMeta object) {
    return {
      'sync_status': object.status.toString().split('.').last,
    };
  }
}
