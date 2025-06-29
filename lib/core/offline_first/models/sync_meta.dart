import '../enums/sync_status.dart';

class SyncMeta {
  final DateTime? updatedAt;
  final SyncStatus status;
  final DateTime? lastSyncedAt;
  final DateTime? modifiedLocallyAt;

  const SyncMeta({this.updatedAt, this.status = SyncStatus.synced, this.lastSyncedAt, this.modifiedLocallyAt});

  @override
  String toString() {
    return 'SyncMeta('
        'updatedAt: ${updatedAt?.toIso8601String()}, '
        'status: $status, '
        'lastSyncedAt: ${lastSyncedAt?.toIso8601String()}, '
        'modifiedLocallyAt: ${modifiedLocallyAt?.toIso8601String()}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SyncMeta && other.updatedAt == updatedAt && other.status == status && other.lastSyncedAt == lastSyncedAt && other.modifiedLocallyAt == modifiedLocallyAt;
  }

  @override
  int get hashCode => Object.hash(updatedAt, status, lastSyncedAt, modifiedLocallyAt);

  bool get isSynced => status == SyncStatus.synced;
}
