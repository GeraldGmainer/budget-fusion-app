import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstSingleRepoImpl<T, U extends OfflineFirstDto> implements OfflineFirstSingleRepo<T> {
  final OfflineFirstDataManager<U> manager;

  OfflineFirstSingleRepoImpl(DataManagerFactory dataManagerFactory, DomainType domainType)
      : manager = dataManagerFactory.createManager<U>(domainType: domainType);

  @override
  Stream<T> watch() => manager.stream.map((dtos) => toDomain(dtos.first));

  @override
  Future<void> load({Map<String, dynamic>? filters}) => manager.loadAll(filters: filters);

  @override
  Future<void> save(T entity) => manager.save(toDto(entity));

  @override
  void dispose() => manager.dispose();

  T toDomain(U dto);

  U toDto(T entity);
}
