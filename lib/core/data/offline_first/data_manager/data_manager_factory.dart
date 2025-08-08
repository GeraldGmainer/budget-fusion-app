import 'package:injectable/injectable.dart';

import '../../../enums/entity_type.dart';
import '../../../remote_loading/service/remote_loading_service.dart';
import '../../domain_sync_adapter.dart';
import '../../sync_manager/sync_manager.dart';
import '../cache/cache_manager.dart';
import '../data_sources/offline_first_local_data_source.dart';
import '../data_sources/offline_first_remote_data_source.dart';
import '../models/offline_first_dto.dart';
import '../queue/queue_manager.dart';
import '../realtime/realtime_notifier_service.dart';
import 'offline_first_data_manager.dart';

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
      adapter: createAdapter(entityType, localDataSource, remoteDataSource),
      cacheManager: cacheManager,
      queueManager: queueManager,
      syncManager: syncManager,
      realtimeNotifierService: realtimeNotifierService,
      remoteLoadingService: remoteLoadingService,
    );
  }

  DomainSyncAdapter<Dto> createAdapter<Dto extends OfflineFirstDto>(EntityType type, OfflineFirstLocalDataSource<Dto> local, OfflineFirstRemoteDataSource<Dto> remote) {
    return DomainSyncAdapter<Dto>(
      type: type,
      local: local,
      remote: remote,
    );
  }
}
