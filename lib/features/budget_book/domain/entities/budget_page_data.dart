import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'budget_date_range.dart';

part 'budget_page_data.freezed.dart';

@freezed
class BudgetPageData with _$BudgetPageData {
  const BudgetPageData._();

  const factory BudgetPageData({
    required BudgetDateRange dateRange,
    required Decimal income,
    required Decimal outcome,
    required List<Booking> bookings,
  }) = _BudgetPageData;

  Decimal get balance {
    return income - outcome;
  }
}
