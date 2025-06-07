import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';

@lazySingleton
class DataManagerFactory {
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final RealtimeNotifierService realtimeNotifierService;
  final RemoteLoadingService remoteLoadingService;

  DataManagerFactory(this.cacheManager, this.queueManager, this.realtimeNotifierService, this.remoteLoadingService);

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
      realtimeNotifierService: realtimeNotifierService,
      remoteLoadingService: remoteLoadingService,
    );
  }
}
