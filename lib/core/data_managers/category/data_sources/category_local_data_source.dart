import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../dtos/category_dto.dart';

@lazySingleton
class CategoryLocalDataSource extends OfflineFirstLocalDataSource<CategoryDto> {
  CategoryLocalDataSource(super.db);

  @override
  String get table => "category";

  @override
  String? get defaultOrderBy => "name ASC";

  @override
  CategoryDto fromJson(Map<String, dynamic> json) => CategoryDto.fromJson(json);
}
