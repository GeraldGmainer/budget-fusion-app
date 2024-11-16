import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_group.freezed.dart';

@freezed
class CategoryGroup with _$CategoryGroup {
  const CategoryGroup._();

  const factory CategoryGroup({
    required Category category,
    required List<Booking> bookings,
    required Decimal amount,
  }) = _CategoryGroup;
}

extension CategoryGroupListExtension on List<CategoryGroup> {
  Decimal get totalAmount => fold(Decimal.zero, (sum, group) => sum + group.bookings.totalAmount);

  List<CategoryGroup> incomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.income).toList();
  }

  List<CategoryGroup> outcomeCategories() {
    return where((group) => group.category.categoryType == CategoryType.outcome).toList();
  }
}
