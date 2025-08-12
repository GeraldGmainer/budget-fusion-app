import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/category_dto.dart';

@lazySingleton
class CategoryRemoteDataSource extends RemoteDataSource<CategoryDto> {
  @override
  String get table => 'category';

  @override
  String get columns => 'id, name, category_type, icon_name, icon_color, parent_id, created_at, updated_at, deleted_at';

  @override
  CategoryDto toDto(Map<String, dynamic> json) {
    return CategoryDto.fromJson(json);
  }
}
