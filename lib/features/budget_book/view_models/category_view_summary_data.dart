import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../repos/currency/currency.dart';

part 'category_view_summary_data.freezed.dart';

@freezed
abstract class CategoryViewSummaryData with _$CategoryViewSummaryData {
  const CategoryViewSummaryData._();

  const factory CategoryViewSummaryData({
    required CategoryType categoryType,
    required String categoryName,
    required String? parentCategoryName,
    required String iconName,
    required String iconColor,
    required int percentage,
    required Money money,
    required bool isSynced,
    @Default([]) List<CategoryViewSummaryData> subSummaries,
  }) = _CategoryViewSummaryData;
}
