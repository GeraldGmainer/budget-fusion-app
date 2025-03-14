import 'package:budget_fusion_app/core/offline_first/realtime/realtime_notifier_service.dart';
import 'package:injectable/injectable.dart';

import '../../core.dart';

@lazySingleton
class DataManagerFactory {
  final CacheManager cacheManager;
  final QueueManager queueManager;
  final DomainRegistry domainRegistry;
  final RealtimeNotifierService realtimeNotifierService;

  DataManagerFactory(this.cacheManager, this.queueManager, this.domainRegistry, this.realtimeNotifierService);

  OfflineFirstDataManager<Entity, LocalDto, RemoteDto>
      createManager<Entity extends OfflineFirstEntity, LocalDto extends OfflineFirstLocalDto, RemoteDto extends OfflineFirstRemoteDto>(
          {required DomainType domainType}) {
    return OfflineFirstDataManager<Entity, LocalDto, RemoteDto>(
      domainType: domainType,
      localSource: domainRegistry.getLocal(domainType) as OfflineFirstLocalDataSource<Entity, LocalDto>,
      remoteSource: domainRegistry.getRemote(domainType) as OfflineFirstRemoteDataSource<Entity, RemoteDto>,
      adapter: domainRegistry.getAdapter(domainType) as OfflineFirstAdapter<Entity, LocalDto, RemoteDto>,
      cacheManager: cacheManager,
      queueManager: queueManager,
      realtimeNotifierService: realtimeNotifierService,
    );
  }
}
