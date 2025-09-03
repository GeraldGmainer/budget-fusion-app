import 'package:injectable/injectable.dart';

import '../../../../repos/booking/booking.dart';
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
    return sortedDates.map((day) {
      final dayBookings = groups[day]!
        ..sort((a, b) {
          if (a.createdAt == null && b.createdAt == null) return 0;
          if (a.createdAt == null) return -1;
          if (b.createdAt == null) return 1;
          return b.createdAt!.compareTo(a.createdAt!);
        });
      return TransactionGroup(date: day, bookings: dayBookings);
    }).toList();
  }
}
