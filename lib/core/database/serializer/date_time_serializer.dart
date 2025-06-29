import 'package:json_annotation/json_annotation.dart';

import '../../core.dart';

class SyncMetaSerializer implements JsonConverter<SyncMeta, dynamic> {
  const SyncMetaSerializer();

  @override
  SyncMeta fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      final statusString = json['sync_status'] as String? ?? 'synced';
      final status = SyncStatus.values.firstWhere((e) => e.toString().split('.').last == statusString, orElse: () => SyncStatus.synced);
      DateTime? parse(String? s) => s == null ? null : DateTime.parse(s).toLocal();
      return SyncMeta(status: status, lastSyncedAt: parse(json['last_synced_at'] as String?), modifiedLocallyAt: parse(json['modified_locally_at'] as String?));
    }
    throw FormatException('Cannot convert $json to SyncMeta');
  }

  @override
  dynamic toJson(SyncMeta object) {
    return {
      'sync_status': object.status.toString().split('.').last,
      'last_synced_at': object.lastSyncedAt?.toUtc().toIso8601String(),
      'modified_locally_at': object.modifiedLocallyAt?.toUtc().toIso8601String(),
    };
  }
}
