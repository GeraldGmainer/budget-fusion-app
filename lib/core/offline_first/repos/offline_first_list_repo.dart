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

  // Stream<List<T>> watch() => manager.stream.map((List<U> dtos) => dtos.map((dto) => toDomain(dto)).toList());

  Future<void> loadAll() => manager.loadAll();

  Future<void> save(T entity) => manager.save(toDto(entity));

  Future<void> delete(T entity) => manager.delete(toDto(entity));

  void dispose() => manager.dispose();

  Stream<List<T>> watch();

  U toDto(T entity);
}
