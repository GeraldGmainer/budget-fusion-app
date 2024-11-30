import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class BookingPeriodLoader {
  final BookingRepo _bookingRepo;
  final PeriodRangeConverter _periodRangeConverter;

  BookingPeriodLoader(this._bookingRepo, this._periodRangeConverter);

  Future<List<BookingPeriod>> loadPage(PeriodMode period, int page) async {
    // TODO load only 3 months
    final bookings = await _bookingRepo.getBookings();
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
      return [_createEmptyPeriod(PeriodMode.month, DateTime.now())];
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

  List<BookingPeriod> _generateMonthlyPeriods(DateTime earliestFrom, DateTime end, Map<int, Map<int, List<Booking>>> bookingsByMonthAndCategory) {
    final periods = <BookingPeriod>[];
    DateTime currentMonth = DateTime(earliestFrom.year, earliestFrom.month);

    while (!currentMonth.isAfter(end)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;

      if (!bookingsByMonthAndCategory.containsKey(monthKey)) {
        periods.add(_createEmptyPeriod(PeriodMode.month, currentMonth));
      } else {
        final categoryGroups = _createCategoryGroups(bookingsByMonthAndCategory[monthKey]!);
        final income = _calculateTotalIncome(categoryGroups);
        final outcome = _calculateTotalOutcome(categoryGroups);

        periods.add(BookingPeriod(
          dateRange: _periodRangeConverter.convert(PeriodMode.month, currentMonth),
          income: income,
          outcome: outcome,
          categoryGroups: categoryGroups,
        ));
      }

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return periods;
  }

  BookingPeriod _createEmptyPeriod(PeriodMode period, DateTime dateTime) {
    return BookingPeriod(
      dateRange: _periodRangeConverter.convert(period, dateTime),
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

  List<BookingPeriod> _convertToDay(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPeriod> _convertToYear(List<Booking> bookings) => _convertToAll(bookings);

  List<BookingPeriod> _convertToAll(List<Booking> bookings) {
    return [
      BookingPeriod(
        dateRange: BookingDateRange.all(),
        income: Decimal.zero,
        outcome: Decimal.zero,
        categoryGroups: [],
      )
    ];
  }
}
