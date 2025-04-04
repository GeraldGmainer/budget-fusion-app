import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstListRepo<T, U extends OfflineFirstDto> {
  final OfflineFirstDataManager<U> manager;
  final OfflineFirstLocalDataSource<U> localDataSource;
  final OfflineFirstRemoteDataSource<U> remoteDataSource;

  OfflineFirstListRepo(
    DomainType domainType,
    DataManagerFactory dataManagerFactory,
    this.localDataSource,
    this.remoteDataSource,
  ) : manager = dataManagerFactory.createManager<U>(
          domainType: domainType,
          localDataSource: localDataSource,
          remoteDataSource: remoteDataSource,
        );

  Future<void> loadAll() => manager.loadAll();

  Future<void> save(T entity) => manager.save(toDto(entity));

  Future<void> delete(T entity) => manager.delete(toDto(entity));

  Future<void> reset() => manager.reset();

  void dispose() => manager.dispose();

  Stream<List<T>> watch();

  U toDto(T entity);
}
