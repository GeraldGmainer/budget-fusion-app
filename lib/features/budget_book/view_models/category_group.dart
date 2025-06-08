import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_group.freezed.dart';

@freezed
class CategoryGroup with _$CategoryGroup {
  const CategoryGroup._();

  const factory CategoryGroup({required Category category, @Default([]) List<Booking> bookings, required Money money, @Default([]) List<CategoryGroup> subGroups}) = _CategoryGroup;
}

extension CategoryGroupExtension on CategoryGroup {
  Money get totalGroupAmount => money + subGroups.fold(Money.zero(), (prev, group) => prev + group.totalGroupAmount);
}

extension CategoryGroupListExtension on List<CategoryGroup> {
  Money get totalAmount => fold(Money.zero(), (sum, group) => sum + group.totalGroupAmount);

  Money totalIncomeAmount() => incomeCategories().totalAmount;

  Money totalOutcomeAmount() => outcomeCategories().totalAmount;

  List<CategoryGroup> incomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.income).toList();
  }

  List<CategoryGroup> outcomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.outcome).toList();
  }
}
