import 'package:injectable/injectable.dart';

import '../../../enums/entity_type.dart';
import '../../data_sources/data_source_adapter.dart';
import '../../data_sources/local_data_source.dart';
import '../../data_sources/remote_data_source.dart';
import '../../models/dto.dart';
import '../queue/queue_manager.dart';
import '../realtime/realtime_manager.dart';
import '../sync_manager/sync_manager.dart';
import 'offline_first_data_manager.dart';

@lazySingleton
class DataManagerFactory {
  final QueueManager queueManager;
  final SyncManager syncManager;
  final RealtimeManager realtimeManager;

  DataManagerFactory(
    this.queueManager,
    this.realtimeManager,
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
      realtimeManager: realtimeManager,
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
