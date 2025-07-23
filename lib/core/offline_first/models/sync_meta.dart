import '../enums/sync_status.dart';

class SyncMeta {
  final SyncStatus status;
  final DateTime? lastSyncedAt;
  final DateTime? modifiedLocallyAt;

  const SyncMeta({required this.status, required this.lastSyncedAt, required this.modifiedLocallyAt});

  SyncMeta copyWith({SyncStatus? status, DateTime? lastSyncedAt, DateTime? modifiedLocallyAt}) {
    return SyncMeta(status: status ?? this.status, lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt, modifiedLocallyAt: modifiedLocallyAt ?? this.modifiedLocallyAt);
  }

  @override
  String toString() {
    return 'SyncMeta('
        'status: $status, '
        'lastSyncedAt: ${lastSyncedAt?.toIso8601String()}, '
        'modifiedLocallyAt: ${modifiedLocallyAt?.toIso8601String()}'
        ')';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SyncMeta && other.status == status && other.lastSyncedAt == lastSyncedAt && other.modifiedLocallyAt == modifiedLocallyAt;
  }

  @override
  int get hashCode => Object.hash(status, lastSyncedAt, modifiedLocallyAt);

  bool get isSynced => status == SyncStatus.synced;
}
