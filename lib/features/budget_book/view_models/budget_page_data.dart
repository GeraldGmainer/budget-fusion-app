import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data_managers/booking/booking.dart';
import '../../../data_managers/currency/currency.dart';
import 'budget_date_range.dart';

part 'budget_page_data.freezed.dart';

@freezed
class BudgetPageData with _$BudgetPageData {
  const BudgetPageData._();

  const factory BudgetPageData({required BudgetDateRange dateRange, required Money income, required Money outcome, @Default([]) List<Booking> bookings}) = _BudgetPageData;

  factory BudgetPageData.empty(BudgetDateRange dateRange) => BudgetPageData(dateRange: dateRange, income: Money.zero(), outcome: Money.zero());

  Money get balance => income - outcome;
}
