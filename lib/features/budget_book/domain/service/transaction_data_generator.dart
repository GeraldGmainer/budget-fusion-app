import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';

import '../entities/budget_page_data.dart';
import '../entities/transaction_group.dart';
import '../entities/transaction_view_data.dart';

@lazySingleton
class TransactionDataGenerator {
  TransactionViewData generate(BudgetPageData pageData, Currency currency) {
    final transactions = _mapTransactionGroups(pageData, currency);

    return TransactionViewData(
      currency: currency,
      dateRange: pageData.dateRange,
      transactionGroups: transactions,
    );
  }

  List<TransactionGroup> _mapTransactionGroups(BudgetPageData pageData, Currency currency) {
    final Map<DateTime, List<Booking>> groups = {};
    for (final booking in pageData.bookings) {
      final day = DateTime(booking.date.year, booking.date.month, booking.date.day);
      groups.putIfAbsent(day, () => []).add(booking);
    }
    final sortedDates = groups.keys.toList()..sort((a, b) => b.compareTo(a));
    return sortedDates.map((day) => TransactionGroup(date: day, bookings: groups[day]!, currency: currency)).toList();
  }
}
