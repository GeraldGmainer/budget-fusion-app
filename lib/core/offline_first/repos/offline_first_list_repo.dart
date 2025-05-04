import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/entities/base/uuid.dart';

abstract class OfflineFirstListRepo<T extends Entity, U extends OfflineFirstDto> {
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

  Future<T?> loadById(Uuid id) async {
    final dto = await manager.loadById(id.value);
    return dto != null ? toEntity(dto) : null;
  }

  Future<T> save(T entity) async {
    // TODO use new dto from save method? and use toEntity() ?
    await manager.save(toDto(entity));
    final list = await watch().firstWhere((l) => l.any((e) => e.id == entity.id));
    return list.firstWhere((e) => e.id == entity.id);
  }

  Future<void> delete(T entity) => manager.delete(toDto(entity));

  Future<void> reset() => manager.reset();

  void dispose() => manager.dispose();

  Stream<List<T>> watch();

  U toDto(T entity);

  Future<T> toEntity(U dto);
}
