import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_view_summary_data.freezed.dart';

@freezed
class CategoryViewSummaryData with _$CategoryViewSummaryData {
  const CategoryViewSummaryData._();

  const factory CategoryViewSummaryData({
    required Currency currency,
    required CategoryType categoryType,
    required String categoryName,
    required String? parentCategoryName,
    required String iconName,
    required String iconColor,
    required int percentage,
    required Decimal value,
    required bool isSynced,
    @Default([]) List<CategoryViewSummaryData> subSummaries,
  }) = _CategoryViewSummaryData;
}
