import 'package:budget_fusion_app/core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'base/budget_view_data.dart';
import 'budget_date_range.dart';
import 'transaction_group.dart';

part 'transaction_view_data.freezed.dart';

@freezed
class TransactionViewData with _$TransactionViewData implements BudgetViewData {
  const TransactionViewData._();

  const factory TransactionViewData({required BudgetDateRange dateRange, required List<TransactionGroup> transactionGroups}) = _TransactionViewData;
}
