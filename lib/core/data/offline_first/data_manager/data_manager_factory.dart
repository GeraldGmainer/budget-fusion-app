import 'package:injectable/injectable.dart';

import '../../../enums/entity_type.dart';
import '../../../remote_loading/service/remote_loading_service.dart';
import '../../data_sources/data_source_adapter.dart';
import '../../data_sources/local_data_source.dart';
import '../../data_sources/remote_data_source.dart';
import '../../models/dto.dart';
import '../../sync_manager/sync_manager.dart';
import '../queue/queue_manager.dart';
import '../realtime/realtime_notifier_service.dart';
import 'offline_first_data_manager.dart';

@lazySingleton
class DataManagerFactory {
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeNotifierService realtimeNotifierService;
  final RemoteLoadingService remoteLoadingService;

  DataManagerFactory(
    this.queueManager,
    this.realtimeNotifierService,
    this.remoteLoadingService,
    this.syncManager,
  );

  OfflineFirstDataManager<E> createManager<E extends Dto>({
    required EntityType entityType,
    required LocalDataSource<E> localDataSource,
    required RemoteDataSource<E> remoteDataSource,
  }) {
    return OfflineFirstDataManager<E>(
      adapter: createAdapter(entityType, localDataSource, remoteDataSource),
      queueManager: queueManager,
      syncManager: syncManager,
      realtimeNotifierService: realtimeNotifierService,
      remoteLoadingService: remoteLoadingService,
    );
  }

  DataSourceAdapter<E> createAdapter<E extends Dto>(EntityType type, LocalDataSource<E> local, RemoteDataSource<E> remote) {
    return DataSourceAdapter<E>(
      type: type,
      local: local,
      remote: remote,
    );
  }
}
