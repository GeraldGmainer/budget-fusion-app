import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/category_local_data_source.dart';
import '../data_sources/category_remote_data_source.dart';
import '../dtos/category_dto.dart';

@LazySingleton(as: CategoryRepo)
class CategoryRepoImpl extends OfflineFirstListRepo<Category, CategoryDto> implements CategoryRepo {
  CategoryRepoImpl(
    DataManagerFactory dmf,
    CategoryLocalDataSource lds,
    CategoryRemoteDataSource rds,
  ) : super(DomainType.category, dmf, lds, rds);

  @override
  Stream<List<Category>> watch() {
    return manager.stream.map((dtos) => _mapDtosToDomain(dtos));
  }

  List<Category> _mapDtosToDomain(List<CategoryDto> dtos) {
    final Map<Uuid, Category> categoryMap = {
      for (final dto in dtos)
        dto.id: Category(
          id: dto.id,
          userId: dto.userId,
          name: dto.name,
          categoryType: dto.categoryType,
          iconName: dto.iconName,
          iconColor: dto.iconColor,
          parent: null,
          updatedAt: dto.updatedAt,
        )
    };

    final List<Category> result = [];
    for (final dto in dtos) {
      var category = categoryMap[dto.id]!;
      if (dto.parentId != null) {
        final parent = categoryMap[dto.parentId];
        if (parent == null) {
          BudgetLogger.instance.e("Parent category not found", "Parent category not found for category ${dto.id}. Expected parentId: ${dto.parentId}");
        }
        category = category.copyWith(parent: parent);
        categoryMap[dto.id] = category;
      }
      result.add(category);
    }
    return result;
  }

  @override
  CategoryDto toDto(Category entity) {
    return CategoryDto(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      categoryType: entity.categoryType,
      iconName: entity.iconName,
      iconColor: entity.iconColor,
      parentId: entity.parent?.id,
      updatedAt: entity.updatedAt,
    );
  }
}
