import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_view_summary.freezed.dart';

@freezed
class CategoryViewSummary with _$CategoryViewSummary {
  const CategoryViewSummary._();

  const factory CategoryViewSummary({
    required String categoryName,
    required String iconName,
    required String iconColor,
    required int percentage,
    required Decimal value,
    @Default([]) List<CategoryViewSummary> subSummaries,
  }) = _CategoryViewSummary;
}
