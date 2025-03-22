import 'package:budget_fusion_app/core/core.dart';

class DomainRegistry {
  final Map<DomainType, OfflineFirstRemoteDataSource> _remoteSources = {};
  final Map<DomainType, OfflineFirstLocalDataSource> _localSources = {};

  void register(DomainType domain, OfflineFirstRemoteDataSource remoteSource, OfflineFirstLocalDataSource localSource) {
    _remoteSources[domain] = remoteSource;
    _localSources[domain] = localSource;
  }

  OfflineFirstRemoteDataSource getRemote(DomainType domainType) => _remoteSources[domainType]!;

  OfflineFirstLocalDataSource getLocal(DomainType domainType) => _localSources[domainType]!;
}
