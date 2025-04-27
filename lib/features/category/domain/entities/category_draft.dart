import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_draft.freezed.dart';

@freezed
class CategoryDraft with _$CategoryDraft {
  const CategoryDraft._();

  factory CategoryDraft({
    Uuid? id,
    Uuid? userId,
    String? name,
    @Default(CategoryType.outcome) CategoryType categoryType,
    @Default("book_open_outline") String iconName,
    @Default("9E9E9E") String iconColor,
    Category? parent,
    @Default([]) List<Category> subcategories,
  }) = _CategoryDraft;

  bool get isCreating => id == null;

  Category toCategory(Uuid userId) {
    return Category(
      id: id ?? Uuid.generate(),
      userId: userId,
      name: name!,
      categoryType: categoryType,
      iconName: iconName,
      iconColor: iconColor,
      parent: parent,
      subcategories: subcategories,
      updatedAt: DateTime.now(),
    );
  }

  factory CategoryDraft.fromCategory(Category category) {
    return CategoryDraft(
      id: category.id,
      userId: category.userId,
      name: category.name,
      categoryType: category.categoryType,
      iconName: category.iconName,
      iconColor: category.iconColor,
      parent: category.parent,
      subcategories: category.subcategories,
    );
  }
}

// extension CategoryDraftX on CategoryDraft {
//   bool equalsCategory(Category category) {
//     return id == category.id &&
//         userId == category.userId &&
//         name == category.name &&
//         categoryType == category.categoryType &&
//         iconName == category.iconName &&
//         iconColor == category.iconColor &&
//         _parentEquals(category) &&
//         _subcategoriesEqual(category);
//   }
//
//   Map<String, bool> compareWith(Category category) {
//     return {
//       'id': id == category.id,
//       'userId': userId == category.userId,
//       'name': name == category.name,
//       'categoryType': categoryType == category.categoryType,
//       'iconName': iconName == category.iconName,
//       'iconColor': iconColor == category.iconColor,
//       'parent': _parentEquals(category),
//       'subcategories': _subcategoriesEqual(category),
//     };
//   }
//
//   bool _parentEquals(Category category) {
//     final p1 = parent?.id;
//     final p2 = category.parent?.id;
//     return p1 == p2;
//   }
//
//   bool _subcategoriesEqual(Category category) {
//     final a = subcategories.map((c) => c.id).toList();
//     final b = category.subcategories.map((c) => c.id).toList();
//     return _listsEqual(a, b);
//   }
//
//   bool _listsEqual<T>(List<T> a, List<T> b) {
//     if (a.length != b.length) return false;
//     for (var i = 0; i < a.length; i++) {
//       if (a[i] != b[i]) return false;
//     }
//     return true;
//   }
// }
