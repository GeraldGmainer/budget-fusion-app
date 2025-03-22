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

  OfflineFirstDataManager<Dto> createManager<Dto extends OfflineFirstDto>({
    required DomainType domainType,
  }) {
    return OfflineFirstDataManager<Dto>(
      domainType: domainType,
      localSource: domainRegistry.getLocal(domainType) as OfflineFirstLocalDataSource<Dto>,
      remoteSource: domainRegistry.getRemote(domainType) as OfflineFirstRemoteDataSource<Dto>,
      cacheManager: cacheManager,
      queueManager: queueManager,
      realtimeNotifierService: realtimeNotifierService,
    );
  }
}
