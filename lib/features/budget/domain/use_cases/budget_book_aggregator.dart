import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BudgetBookAggregator {
  final BookingRepo bookingRepo;

  BudgetBookAggregator({required this.bookingRepo});

  Future<List<BookingPeriod>> getAccountGroups(PeriodMode period) async {
    // TODO filter by date depending on period
    // TODO load only 3 months backwards
    final bookings = await bookingRepo.getBookings();
    return _mapBookings(period, bookings);
  }

  List<BookingPeriod> _mapBookings(PeriodMode period, List<Booking> bookings) {
    switch (period) {
      case PeriodMode.day:
        return _convertToDay(bookings);
      case PeriodMode.month:
        return _convertToMonth(bookings);
      case PeriodMode.year:
        return _convertToYear(bookings);
      case PeriodMode.all:
        return _convertToAll(bookings);
    }
  }

  List<BookingPeriod> _convertToMonth(List<Booking> bookings) {
    if (bookings.isEmpty) {
      return [_createEmptyPeriod(DateTime.now(), PeriodMode.month)];
    }

    final bookingsByMonthAndCategory = _groupBookingsByMonthAndCategory(bookings);
    final startDate = _findEarliestDate(bookings);
    final endDate = DateTime.now();

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

  List<BookingPeriod> _generateMonthlyPeriods(DateTime startDate, DateTime endDate, Map<int, Map<int, List<Booking>>> bookingsByMonthAndCategory) {
    final periods = <BookingPeriod>[];
    DateTime currentMonth = DateTime(startDate.year, startDate.month);

    while (!currentMonth.isAfter(endDate)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;

      if (!bookingsByMonthAndCategory.containsKey(monthKey)) {
        periods.add(_createEmptyPeriod(currentMonth, PeriodMode.month));
      } else {
        final categoryGroups = _createCategoryGroups(bookingsByMonthAndCategory[monthKey]!);
        final income = _calculateTotalIncome(categoryGroups);
        final outcome = _calculateTotalOutcome(categoryGroups);

        periods.add(BookingPeriod(
          filter: BookingViewFilter(period: PeriodMode.month, dateTime: currentMonth),
          income: income,
          outcome: outcome,
          categoryGroups: categoryGroups,
        ));
      }

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return periods;
  }

  BookingPeriod _createEmptyPeriod(DateTime date, PeriodMode period) {
    return BookingPeriod(
      filter: BookingViewFilter(period: period, dateTime: date),
      income: Decimal.zero,
      outcome: Decimal.zero,
      categoryGroups: [],
    );
  }

  List<CategoryGroup> _createCategoryGroups(Map<int, List<Booking>> bookingsByCategory) {
    return bookingsByCategory.entries.map((entry) {
      final category = entry.value.first.category; // Assuming all bookings have the same category.
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

  List<BookingPeriod> _convertToDay(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPeriod> _convertToYear(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPeriod> _convertToAll(List<Booking> bookings) {
    return [
      BookingPeriod(
        filter: BookingViewFilter(period: PeriodMode.all),
        income: Decimal.zero,
        outcome: Decimal.zero,
        categoryGroups: [],
      )
    ];
  }
}
