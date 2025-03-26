import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstSingleRepo<T, U extends OfflineFirstDto> {
  final OfflineFirstDataManager<U> manager;
  final OfflineFirstLocalDataSource<U> localDataSource;
  final OfflineFirstRemoteDataSource<U> remoteDataSource;

  OfflineFirstSingleRepo(
    DomainType domainType,
    DataManagerFactory dataManagerFactory,
    this.localDataSource,
    this.remoteDataSource,
  ) : manager = dataManagerFactory.createManager<U>(
          domainType: domainType,
          localDataSource: localDataSource,
          remoteDataSource: remoteDataSource,
        );

  Future<void> load({Map<String, dynamic>? filters}) => manager.loadAll(filters: filters);

  Future<void> save(T entity) => manager.save(toDto(entity));

  void dispose() => manager.dispose();

  Stream<T> watch();

  U toDto(T entity);
}
