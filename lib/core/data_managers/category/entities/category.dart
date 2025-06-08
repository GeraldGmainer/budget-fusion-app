import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core.dart';
import '../dtos/category_dto.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category implements Entity {
  const Category._();

  const factory Category({
    required Uuid id,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
    Category? parent,
    @Default([]) List<Category> subcategories,
    required DateTime updatedAt,
  }) = _Category;

  factory Category.notFound() {
    return Category(
      id: Uuid.generate(),
      name: "not found",
      categoryType: CategoryType.outcome,
      iconName: FeatureConstants.notFoundIconName,
      iconColor: FeatureConstants.notFoundIconColor,
      updatedAt: DateTime.now(),
    );
  }

  factory Category.fromDto(CategoryDto dto) {
    return Category(id: dto.id, name: dto.name, categoryType: dto.categoryType, iconName: dto.iconName, iconColor: dto.iconColor, updatedAt: dto.updatedAt);
  }

  CategoryDto toDto() {
    return CategoryDto(id: id, name: name, categoryType: categoryType, iconName: iconName, iconColor: iconColor, parentId: parent?.id, updatedAt: updatedAt);
  }

  bool get isParent => parent == null;

  bool get isSub => parent != null;
}

extension CategoryIterableX on Iterable<Category> {
  List<Category> sortedByName() {
    final list = toList();
    list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    return list;
  }
}

extension CategoryListX on List<Category> {
  List<Category> get parentCategories => where((c) => c.isParent).sortedByName();

  List<Category> get parentOutcomeCategories => where((c) => c.isParent && c.categoryType == CategoryType.outcome).sortedByName();

  List<Category> get parentIncomeCategories => where((c) => c.isParent && c.categoryType == CategoryType.income).sortedByName();
}
