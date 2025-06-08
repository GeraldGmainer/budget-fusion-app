import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../../view_models/budget_page_data.dart';
import '../../view_models/transaction_group.dart';
import '../../view_models/transaction_view_data.dart';

@lazySingleton
class TransactionDataGenerator {
  TransactionViewData generate(BudgetPageData pageData) {
    final transactions = _mapTransactionGroups(pageData);

    return TransactionViewData(dateRange: pageData.dateRange, transactionGroups: transactions);
  }

  List<TransactionGroup> _mapTransactionGroups(BudgetPageData pageData) {
    final Map<DateTime, List<Booking>> groups = {};
    for (final booking in pageData.bookings) {
      final day = DateTime(booking.date.year, booking.date.month, booking.date.day);
      groups.putIfAbsent(day, () => []).add(booking);
    }
    final sortedDates = groups.keys.toList()..sort((a, b) => b.compareTo(a));
    return sortedDates.map((day) => TransactionGroup(date: day, bookings: groups[day]!)).toList();
  }
}
