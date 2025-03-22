import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstListRepo<T, U extends OfflineFirstDto> {
  final OfflineFirstDataManager<U> _manager;

  OfflineFirstListRepo(DataManagerFactory dataManagerFactory, DomainType domainType) : _manager = dataManagerFactory.createManager<U>(domainType: domainType);

  Stream<List<T>> watch() => _manager.stream.map((List<U> dtos) => dtos.map((dto) => toDomain(dto)).toList());

  Future<void> loadAll() => _manager.loadAll();

  Future<void> save(T entity) => _manager.save(toDto(entity));

  Future<void> delete(T entity) => _manager.delete(toDto(entity));

  void dispose() => _manager.dispose();

  T toDomain(U dto);

  U toDto(T entity);
}
