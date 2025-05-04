import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core.dart';
import '../base/uuid.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category implements Entity {
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
