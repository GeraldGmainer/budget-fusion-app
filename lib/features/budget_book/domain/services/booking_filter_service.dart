import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../domain.dart';

@lazySingleton
class BookingFilterService {
  List<BookingPageData> filterBookings(List<BookingPageData> bookingPageDatas, BudgetBookFilter filter) {
    return bookingPageDatas.map((pageData) {
      final filteredCategoryGroups = pageData.categoryGroups
          .map((group) {
            final filteredBookings = _applyAllFilters(group.bookings, filter);
            final newAmount = filteredBookings.fold(Decimal.zero, (sum, b) => sum + b.amount);
            return group.copyWith(bookings: filteredBookings, amount: newAmount);
          })
          .where((group) => group.bookings.isNotEmpty)
          .toList();

      final newIncome = filteredCategoryGroups.where((g) => g.category.categoryType == CategoryType.income).fold(Decimal.zero, (sum, g) => sum + g.amount);
      final newOutcome = filteredCategoryGroups.where((g) => g.category.categoryType == CategoryType.outcome).fold(Decimal.zero, (sum, g) => sum + g.amount);

      return pageData.copyWith(
        categoryGroups: filteredCategoryGroups,
        income: newIncome,
        outcome: newOutcome,
      );
    }).toList();
  }

  List<Booking> _applyAllFilters(List<Booking> bookings, BudgetBookFilter filter) {
    var filtered = bookings;
    if (filter.account != null) {
      filtered = _filterByAccount(filtered, filter.account!);
    }

    filtered = _filterByTransaction(filtered, filter.transaction);
    if (filter.description != null && filter.description!.isNotEmpty) {
      filtered = _filterByDescription(filtered, filter.description!);
    }
    return filtered;
  }

  List<Booking> _filterByAccount(List<Booking> bookings, Account account) {
    return bookings.where((b) => b.account.id == account.id).toList();
  }

  List<Booking> _filterByTransaction(List<Booking> bookings, TransactionType txType) {
    final requiredCategoryType = (txType == TransactionType.income) ? CategoryType.income : CategoryType.outcome;

    return bookings.where((b) => b.category.categoryType == requiredCategoryType).toList();
  }

  List<Booking> _filterByDescription(List<Booking> bookings, String desc) {
    final lowerDesc = desc.toLowerCase();
    return bookings.where((b) {
      final bookingDesc = b.description?.toLowerCase() ?? '';
      return bookingDesc.contains(lowerDesc);
    }).toList();
  }
}
