import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category_group.dart';

part 'account_group.freezed.dart';

@freezed
class AccountGroup with _$AccountGroup {
  const AccountGroup._();

  const factory AccountGroup({
    required Account account,
    required List<CategoryGroup> categoryGroups,
  }) = _AccountGroup;
}

extension AccountGroupListExtension on List<AccountGroup> {
  List<CategoryGroup> incomeCategories() {
    return expand((accountGroup) => accountGroup.categoryGroups).where((categoryGroup) => categoryGroup.category.categoryType == CategoryType.income).toList();
  }

  List<CategoryGroup> outcomeCategories() {
    return expand((accountGroup) => accountGroup.categoryGroups).where((categoryGroup) => categoryGroup.category.categoryType == CategoryType.outcome).toList();
  }
}
