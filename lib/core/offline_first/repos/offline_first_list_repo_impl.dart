import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstListRepoImpl<T, U extends OfflineFirstDto> implements OfflineFirstListRepo<T> {
  final OfflineFirstDataManager<U> _manager;

  OfflineFirstListRepoImpl(DataManagerFactory dataManagerFactory, DomainType domainType)
      : _manager = dataManagerFactory.createManager<U>(domainType: domainType);

  @override
  Stream<List<T>> watch() => _manager.stream.map((List<U> dtos) => dtos.map((dto) => toDomain(dto)).toList());

  @override
  Future<void> loadAll() => _manager.loadAll();

  @override
  Future<void> save(T entity) => _manager.save(toDto(entity));

  @override
  Future<void> delete(T entity) => _manager.delete(toDto(entity));

  @override
  void dispose() => _manager.dispose();

  T toDomain(U dto);

  U toDto(T entity);
}
