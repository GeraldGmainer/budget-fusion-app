import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';
import '../sync_manager/sync_manager.dart';

@lazySingleton
class DataManagerFactory {
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeNotifierService realtimeNotifierService;
  final RemoteLoadingService remoteLoadingService;

  DataManagerFactory(
    this.cacheManager,
    this.queueManager,
    this.realtimeNotifierService,
    this.remoteLoadingService,
    this.syncManager,
  );

  OfflineFirstDataManager<Dto> createManager<Dto extends OfflineFirstDto>({
    required EntityType entityType,
    required OfflineFirstLocalDataSource<Dto> localDataSource,
    required OfflineFirstRemoteDataSource<Dto> remoteDataSource,
  }) {
    return OfflineFirstDataManager<Dto>(
      entityType: entityType,
      localSource: localDataSource,
      remoteSource: remoteDataSource,
      cacheManager: cacheManager,
      queueManager: queueManager,
      syncManager: syncManager,
      realtimeNotifierService: realtimeNotifierService,
      remoteLoadingService: remoteLoadingService,
    );
  }
}
