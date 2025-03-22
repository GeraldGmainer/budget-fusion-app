import 'package:budget_fusion_app/core/core.dart';

abstract class OfflineFirstSingleRepo<T, U extends OfflineFirstDto> {
  final OfflineFirstDataManager<U> manager;

  OfflineFirstSingleRepo(DataManagerFactory dataManagerFactory, DomainType domainType) : manager = dataManagerFactory.createManager<U>(domainType: domainType);

  Stream<T> watch() => manager.stream.map((dtos) => toDomain(dtos.first));

  Future<void> load({Map<String, dynamic>? filters}) => manager.loadAll(filters: filters);

  Future<void> save(T entity) => manager.save(toDto(entity));

  void dispose() => manager.dispose();

  T toDomain(U dto);

  U toDto(T entity);
}
