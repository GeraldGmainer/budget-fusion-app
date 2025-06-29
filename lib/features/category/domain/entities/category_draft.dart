import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_draft.freezed.dart';

@freezed
class CategoryDraft with _$CategoryDraft {
  const CategoryDraft._();

  factory CategoryDraft({
    Uuid? id,
    String? name,
    @Default(CategoryType.outcome) CategoryType categoryType,
    @Default("book_open_outline") String iconName,
    @Default("9E9E9E") String iconColor,
    Category? parent,
    @Default([]) List<Category> subcategories,
    SyncMeta? syncMeta,
  }) = _CategoryDraft;

  bool get isCreating => id == null;

  Category toCategory() {
    return Category(
      id: id ?? Uuid.generate(),
      name: name!,
      categoryType: categoryType,
      iconName: iconName,
      iconColor: iconColor,
      parent: parent,
      subcategories: subcategories,
      syncMeta: syncMeta ?? SyncMeta(),
    );
  }

  factory CategoryDraft.initial({Category? parent}) {
    return CategoryDraft(parent: parent);
  }

  factory CategoryDraft.fromCategory(Category category) {
    return CategoryDraft(
      id: category.id,
      name: category.name,
      categoryType: category.categoryType,
      iconName: category.iconName,
      iconColor: category.iconColor,
      parent: category.parent,
      subcategories: category.subcategories,
      syncMeta: category.syncMeta,
    );
  }
}
