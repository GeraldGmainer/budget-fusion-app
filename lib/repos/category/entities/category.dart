import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core.dart';
import '../dtos/category_dto.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category, Entity {
  const Category._();

  const factory Category({
    required Uuid id,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
    Category? parent,
    @Default([]) List<Category> subcategories,
    SyncStatus? syncStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Category;

  factory Category.notFound() {
    return Category(
      id: Uuid.generate(),
      name: "not found",
      categoryType: CategoryType.outcome,
      iconName: FeatureConstants.notFoundIconName,
      iconColor: FeatureConstants.notFoundIconColor,
    );
  }

  factory Category.fromDto(CategoryDto dto) {
    return Category(
      id: dto.id,
      name: dto.name,
      categoryType: dto.categoryType,
      iconName: dto.iconName,
      iconColor: dto.iconColor,
      syncStatus: dto.syncStatus,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  CategoryDto toDto() {
    return CategoryDto(
      id: id,
      name: name,
      categoryType: categoryType,
      iconName: iconName,
      iconColor: iconColor,
      parentId: parent?.id,
      syncStatus: syncStatus,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
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

  List<Category> flat() {
    final out = <Category>[];
    final stack = <Category>[];
    stack.addAll(this);
    while (stack.isNotEmpty) {
      final c = stack.removeLast();
      out.add(c);
      if (c.subcategories.isNotEmpty) {
        stack.addAll(c.subcategories);
      }
    }
    return out;
  }

  List<R> flatMap<R>(R Function(Category c) mapper) => flat().map(mapper).toList();
}
