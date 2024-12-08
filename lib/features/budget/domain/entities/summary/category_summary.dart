import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_summary.freezed.dart';

@freezed
class CategorySummary with _$CategorySummary {
  const CategorySummary._();

  const factory CategorySummary({
    required String categoryName,
    required String iconName,
    required String iconColor,
    required int percentage,
    required Decimal value,
  }) = _CategorySummary;
}
