import 'package:injectable/injectable.dart';

import '../../core/core.dart';
import 'data_sources/category_local_data_source.dart';
import 'data_sources/category_remote_data_source.dart';
import 'dtos/category_dto.dart';
import 'entities/category.dart';
import 'mappers/category_mapper.dart';

@singleton
class CategoryRepo extends Repo<Category> with AutoSubscribe<Category> {
  late final OfflineFirstDataManager<CategoryDto> _manager;
  final CategoryMapper _mapper;

  CategoryRepo(DataManagerFactory dmf, CategoryLocalDataSource lds, CategoryRemoteDataSource rds, this._mapper)
    : _manager = dmf.createManager<CategoryDto>(entityType: EntityType.category, localDataSource: lds, remoteDataSource: rds);

  @override
  Future<List<Category>> loadAll({Map<String, dynamic>? filters, bool forceReload = false}) async {
    final dtos = await _manager.loadAll(filters: filters, forceReload: forceReload);
    return _toEntities(dtos);
  }

  @override
  Stream<List<Category>> watch() => _manager.stream.map((dtos) => _mapper.fromDtos(dtos.withoutPendingDelete()));

  Future<Category?> loadById(Uuid id) async {
    final dto = await _manager.loadById(id.value);
    if (dto == null) return null;
    final dtos = await _manager.loadAll(forceReload: false);
    return _toEntities(dtos).firstWhere((c) => c.id == dto.id);
  }

  List<Category> _toEntities(List<CategoryDto> dtos) => dtos.withoutPendingDelete().map(Category.fromDto).toList();

  Future<void> delete(Category entity) async => await _manager.delete(entity.toDto());

  Future<void> save(Category entity) async => await _manager.save(entity.toDto());

  void dispose() => _manager.dispose();

  Future<void> reset() => _manager.reset();
}
