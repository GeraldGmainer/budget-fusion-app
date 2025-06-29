import '../../core.dart';

SyncMeta syncMetadataFromMap(Map<String, dynamic> row) {
  final statusString = row['sync_status'] as String? ?? 'synced';
  final status = SyncStatus.values.firstWhere((e) => e.toString().split('.').last == statusString, orElse: () => SyncStatus.synced);

  DateTime? parseDate(String? s) => s == null ? null : DateTime.parse(s);

  return SyncMeta(
    updatedAt: parseDate(row['updated_at'] as String?),
    status: status,
    lastSyncedAt: parseDate(row['last_synced_at'] as String?),
    modifiedLocallyAt: parseDate(row['modified_locally_at'] as String?),
  );
}

Map<String, dynamic> syncMetadataToMap(SyncMeta meta) {
  return {
    'updated_at': meta.updatedAt?.toIso8601String(),
    'sync_status': meta.status.toString().split('.').last,
    'last_synced_at': meta.lastSyncedAt?.toIso8601String(),
    'modified_locally_at': meta.modifiedLocallyAt?.toIso8601String(),
  };
}
