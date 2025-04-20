import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();

  const factory Category({
    required Uuid id,
    required Uuid userId,
    required String name,
    required CategoryType categoryType,
    required String iconName,
    required String iconColor,
    required Category? parent,
    required List<Category> subcategories,
    required DateTime updatedAt,
  }) = _Category;

  bool get isParent => parent == null;

  bool get isSub => parent != null;
}

extension CategoryListX on List<Category> {
  List<Category> get parentCategories => where((c) => c.isParent).toList();

  List<Category> get parentOutcomeCategories => where((c) => c.isParent && c.categoryType == CategoryType.outcome).toList();

  List<Category> get parentIncomeCategories => where((c) => c.isParent && c.categoryType == CategoryType.income).toList();
}
