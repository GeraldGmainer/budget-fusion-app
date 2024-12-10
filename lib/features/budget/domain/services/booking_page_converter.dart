import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/core/extensions/date_time_extension.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPageConverter {
  List<BookingPageData> mapBookings(PeriodMode period, List<Booking> bookings, DateTime? endDate) {
    switch (period) {
      case PeriodMode.day:
        return _convertToDay(bookings);
      case PeriodMode.month:
        return _convertToMonth(bookings, endDate!);
      case PeriodMode.year:
        return _convertToYear(bookings);
      case PeriodMode.all:
        return _convertToAll(bookings);
    }
  }

  List<BookingPageData> _convertToMonth(List<Booking> bookings, DateTime endDate) {
    if (bookings.isEmpty) {
      return [_createEmptyPeriod(PeriodMode.month, endDate.startOfMonth, endDate)];
    }

    final bookingsByMonthAndCategory = _groupBookingsByMonthAndCategory(bookings);
    final startDate = _findEarliestDate(bookings);

    return _generateMonthlyPeriods(startDate, endDate, bookingsByMonthAndCategory);
  }

  Map<int, Map<int, List<Booking>>> _groupBookingsByMonthAndCategory(List<Booking> bookings) {
    final grouped = <int, Map<int, List<Booking>>>{};

    for (var booking in bookings) {
      final monthKey = DateTime(booking.bookingDate.year, booking.bookingDate.month).millisecondsSinceEpoch;
      grouped.putIfAbsent(monthKey, () => {});
      grouped[monthKey]!.putIfAbsent(booking.category.id, () => []);
      grouped[monthKey]![booking.category.id]!.add(booking);
    }

    return grouped;
  }

  DateTime _findEarliestDate(List<Booking> bookings) {
    return bookings.map((b) => b.bookingDate).reduce((a, b) => a.isBefore(b) ? a : b);
  }

  List<BookingPageData> _generateMonthlyPeriods(DateTime earliestFrom, DateTime end, Map<int, Map<int, List<Booking>>> bookingsByMonthAndCategory) {
    final periods = <BookingPageData>[];
    DateTime currentMonth = earliestFrom.startOfMonth;

    while (!currentMonth.isAfter(end)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;
      final toDate = currentMonth.endOfMonth;

      if (!bookingsByMonthAndCategory.containsKey(monthKey)) {
        periods.add(_createEmptyPeriod(PeriodMode.month, currentMonth, toDate));
      } else {
        final categoryGroups = _createCategoryGroups(bookingsByMonthAndCategory[monthKey]!);
        final income = _calculateTotalIncome(categoryGroups);
        final outcome = _calculateTotalOutcome(categoryGroups);

        periods.add(BookingPageData(
          dateRange: BookingDateRange(period: PeriodMode.month, from: currentMonth, to: toDate),
          income: income,
          outcome: outcome,
          categoryGroups: categoryGroups,
        ));
      }

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return periods;
  }

  BookingPageData _createEmptyPeriod(PeriodMode period, DateTime fromDate, DateTime toDate) {
    return BookingPageData(
      dateRange: BookingDateRange(period: period, from: fromDate, to: toDate),
      income: Decimal.zero,
      outcome: Decimal.zero,
      categoryGroups: [],
    );
  }

  List<CategoryGroup> _createCategoryGroups(Map<int, List<Booking>> bookingsByCategory) {
    return bookingsByCategory.entries.map((entry) {
      final category = entry.value.first.category;
      final amount = entry.value.fold(Decimal.zero, (sum, booking) => sum + booking.amount);
      return CategoryGroup(category: category, bookings: entry.value, amount: amount);
    }).toList()
      ..sort(_compareCategoryGroups);
  }

  Decimal _calculateTotalIncome(List<CategoryGroup> groups) {
    return groups.incomeCategories().totalAmount;
  }

  Decimal _calculateTotalOutcome(List<CategoryGroup> groups) {
    return groups.outcomeCategories().totalAmount;
  }

  int _compareCategoryGroups(CategoryGroup a, CategoryGroup b) {
    final typeComparison = a.category.categoryType.index.compareTo(b.category.categoryType.index);
    final amountComparison = b.amount.compareTo(a.amount);
    return typeComparison != 0 ? typeComparison : amountComparison;
  }

  List<BookingPageData> _convertToDay(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPageData> _convertToYear(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPageData> _convertToAll(List<Booking> bookings) {
    return [
      BookingPageData(
        dateRange:
            BookingDateRange(period: PeriodMode.all, from: DateTime.fromMillisecondsSinceEpoch(0), to: DateTime.fromMillisecondsSinceEpoch(9999999999999)),
        income: Decimal.zero,
        outcome: Decimal.zero,
        categoryGroups: [],
      )
    ];
  }
}
