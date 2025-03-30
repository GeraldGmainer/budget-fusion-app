import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_view_summary.freezed.dart';

@freezed
class CategoryViewSummary with _$CategoryViewSummary {
  const CategoryViewSummary._();

  const factory CategoryViewSummary({
    required Currency currency,
    required CategoryType categoryType,
    required String categoryName,
    required String? parentCategoryName,
    required String iconName,
    required String iconColor,
    required int percentage,
    required Decimal value,
    @Default([]) List<CategoryViewSummary> subSummaries,
  }) = _CategoryViewSummary;
}
