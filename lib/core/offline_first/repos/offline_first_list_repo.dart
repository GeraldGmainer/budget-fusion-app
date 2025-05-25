import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';

// ! dont make implementations LazySingleton !
abstract class OfflineFirstListRepo<T extends Entity, U extends OfflineFirstDto> {
  final OfflineFirstDataManager<U> manager;
  final OfflineFirstLocalDataSource<U> localDataSource;
  final OfflineFirstRemoteDataSource<U> remoteDataSource;

  OfflineFirstListRepo(DomainType domainType, DataManagerFactory dataManagerFactory, this.localDataSource, this.remoteDataSource)
    : manager = dataManagerFactory.createManager<U>(domainType: domainType, localDataSource: localDataSource, remoteDataSource: remoteDataSource);

  Future<void> loadAll({Map<String, dynamic>? filters}) => manager.loadAll(filters: filters);

  Future<T?> loadById(Uuid id) async {
    final dto = await manager.loadById(id.value);
    return dto != null ? toEntity(dto) : null;
  }

  Future<T> save(T entity) async {
    final dto = toDto(entity);
    await manager.save(dto);

    final savedDto = await manager.loadById(dto.id.value);
    if (savedDto == null) {
      BudgetLogger.instance.e("${runtimeType.toString()} SaveException", "Could not find DTO by ID after saving");
      return entity;
    }
    return await toEntity(savedDto);
  }

  Future<void> delete(T entity) => manager.delete(toDto(entity));

  Future<void> reset() => manager.reset();

  void dispose() => manager.dispose();

  Stream<List<T>> watch();

  U toDto(T entity);

  Future<T> toEntity(U dto);
}
