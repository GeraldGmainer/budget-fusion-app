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

  Stream<T> watch() => manager.stream.map((dtos) => toDomain(dtos.first));

  Future<void> load({Map<String, dynamic>? filters}) => manager.loadAll(filters: filters);

  Future<void> save(T entity) => manager.save(toDto(entity));

  void dispose() => manager.dispose();

  T toDomain(U dto);

  U toDto(T entity);
}
