import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../entities/budget_book_filter.dart';
import '../entities/budget_date_range.dart';
import '../entities/budget_page_data.dart';
import '../entities/category_group.dart';
import '../enums/period_mode.dart';

@lazySingleton
class BudgetPageDataService {
  Future<List<BudgetPageData>> load(List<Booking> bookings, BudgetBookFilter filter) async {
    if (bookings.isEmpty) {
      return [BudgetPageData.empty(filter.period)];
    }

    switch (filter.period) {
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

  List<BudgetPageData> _convertToMonth(List<Booking> bookings) {
    final bookingsByMonthAndCategory = _groupBookingsByMonthAndCategory(bookings);
    DateTime fromDate = bookings.map((booking) => booking.date).reduce((a, b) => a.isBefore(b) ? a : b);
    DateTime endDate = bookings.map((booking) => booking.date).reduce((a, b) => a.isAfter(b) ? a : b);
    return _generateMonthlyPeriods(fromDate, endDate, bookingsByMonthAndCategory);
  }

  Map<int, Map<String, List<Booking>>> _groupBookingsByMonthAndCategory(List<Booking> bookings) {
    final grouped = <int, Map<String, List<Booking>>>{};

    for (var booking in bookings) {
      final monthKey = DateTime(booking.date.year, booking.date.month).millisecondsSinceEpoch;
      if (booking.category == null) {
        BudgetLogger.instance.e("Null Category", "Category is NULL for booking: $booking");
        continue;
      }
      grouped.putIfAbsent(monthKey, () => {});
      grouped[monthKey]!.putIfAbsent(booking.category!.id.toString(), () => []);
      grouped[monthKey]![booking.category!.id.toString()]!.add(booking);
    }

    return grouped;
  }

  List<BudgetPageData> _generateMonthlyPeriods(DateTime from, DateTime end, Map<int, Map<String, List<Booking>>> bookingsByMonthAndCategory) {
    final periods = <BudgetPageData>[];
    DateTime currentMonth = from.startOfMonth;

    while (!currentMonth.isAfter(end)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;
      final toDate = currentMonth.endOfMonth;

      if (!bookingsByMonthAndCategory.containsKey(monthKey)) {
        periods.add(BudgetPageData.empty(PeriodMode.month));
      } else {
        final categoryGroups = _createCategoryGroups(bookingsByMonthAndCategory[monthKey]!);
        final income = _calculateTotalIncome(categoryGroups);
        final outcome = _calculateTotalOutcome(categoryGroups);

        periods.add(BudgetPageData(
          dateRange: BudgetDateRange(period: PeriodMode.month, from: currentMonth, to: toDate),
          income: income,
          outcome: outcome,
          categoryGroups: categoryGroups,
        ));
      }

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return periods;
  }

  List<CategoryGroup> _createCategoryGroups(Map<String, List<Booking>> bookingsByCategory) {
    return bookingsByCategory.entries.map((entry) {
      final category = entry.value.first.category;
      final amount = entry.value.fold(Decimal.zero, (sum, booking) => sum + booking.amount);
      return CategoryGroup(category: category!, bookings: entry.value, amount: amount);
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

  List<BudgetPageData> _convertToDay(List<Booking> bookings) => _convertToAll(bookings);

  List<BudgetPageData> _convertToYear(List<Booking> bookings) => _convertToAll(bookings);

  List<BudgetPageData> _convertToAll(List<Booking> bookings) {
    return [BudgetPageData.empty(PeriodMode.all)];
  }
}
