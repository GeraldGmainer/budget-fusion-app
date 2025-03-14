import 'package:budget_fusion_app/core/core.dart';

class DomainRegistry {
  final Map<DomainType, OfflineFirstRemoteDataSource> _remoteSources = {};
  final Map<DomainType, OfflineFirstLocalDataSource> _localSources = {};
  final Map<DomainType, OfflineFirstAdapter> _adapters = {};

  void register(DomainType domain, OfflineFirstRemoteDataSource remoteSource, OfflineFirstLocalDataSource localSource, OfflineFirstAdapter adapter) {
    _remoteSources[domain] = remoteSource;
    _localSources[domain] = localSource;
    _adapters[domain] = adapter;
  }

  OfflineFirstRemoteDataSource getRemote(DomainType domainType) => _remoteSources[domainType]!;

  OfflineFirstLocalDataSource getLocal(DomainType domainType) => _localSources[domainType]!;

  OfflineFirstAdapter getAdapter(DomainType domainType) => _adapters[domainType]!;
}
