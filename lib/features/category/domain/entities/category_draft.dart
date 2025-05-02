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

  factory CategoryDraft.initial({Category? parent}) {
    return CategoryDraft(parent: parent);
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
