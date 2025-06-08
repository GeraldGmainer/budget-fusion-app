import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_group.freezed.dart';

@freezed
class CategoryGroup with _$CategoryGroup {
  const CategoryGroup._();

  const factory CategoryGroup({
    required Category category,
    @Default([]) List<Booking> bookings,
    required Decimal amount,
    @Default([]) List<CategoryGroup> subGroups,
  }) = _CategoryGroup;
}

extension CategoryGroupExtension on CategoryGroup {
  Decimal get totalGroupAmount => amount + subGroups.fold(Decimal.zero, (prev, group) => prev + group.totalGroupAmount);
}

extension CategoryGroupListExtension on List<CategoryGroup> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, group) => sum + group.totalGroupAmount);

  Decimal totalIncomeAmount() => incomeCategories().totalAmount;

  Decimal totalOutcomeAmount() => outcomeCategories().totalAmount;

  List<CategoryGroup> incomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.income).toList();
  }

  List<CategoryGroup> outcomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.outcome).toList();
  }
}
