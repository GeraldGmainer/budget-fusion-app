import '../enums/sync_status.dart';

class SyncMeta {
  final SyncStatus status;

  const SyncMeta({required this.status});

  SyncMeta copyWith({SyncStatus? status}) {
    return SyncMeta(status: status ?? this.status);
  }

  @override
  String toString() {
    return 'SyncMeta(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SyncMeta && other.status == status;
  }

  @override
  int get hashCode => status.hashCode;

  bool get isSynced => status == SyncStatus.synced;
}
