import 'package:budget_fusion_app/core/core.dart';
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
  Category toDomain(CategoryDto dto) {
    return Category(
      id: dto.id,
      userId: dto.userId,
      name: dto.name,
      categoryType: dto.categoryType,
      iconName: dto.iconName,
      iconColor: dto.iconColor,
      updatedAt: dto.updatedAt,
    );
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
      updatedAt: entity.updatedAt,
    );
  }
}
