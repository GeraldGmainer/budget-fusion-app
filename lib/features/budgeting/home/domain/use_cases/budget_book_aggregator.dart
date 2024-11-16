import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../../home.dart';

@lazySingleton
class BudgetBookAggregator {
  final BookingRepo bookingRepo;

  BudgetBookAggregator({
    required this.bookingRepo,
  });

  Future<List<BookingPeriod>> getAccountGroups(PeriodMode period) async {
    // TODO filter by date depending on period
    // TODO load only 3 months backwards
    final bookings = await bookingRepo.getBookings();
    final periods = _mapBookings(period, bookings);
    return periods;
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

  List<BookingPeriod> _convertToDay(List<Booking> bookings) {
    return _convertToAll(bookings);
  }

  List<BookingPeriod> _convertToMonth(List<Booking> bookings) {
    if (bookings.isEmpty) {
      final periodFilter = BookingViewFilter(period: PeriodMode.month, dateTime: DateTime.now());
      return [BookingPeriod(filter: periodFilter, income: Decimal.zero, outcome: Decimal.zero, categoryGroups: [])];
    }

    Map<int, Map<int, List<Booking>>> bookingsByCategory = {};

    for (var booking in bookings) {
      final monthKey = DateTime(booking.bookingDate.year, booking.bookingDate.month).millisecondsSinceEpoch;
      int categoryId = booking.category.id;

      if (!bookingsByCategory.containsKey(monthKey)) {
        bookingsByCategory[monthKey] = {};
      }
      if (!bookingsByCategory[monthKey]!.containsKey(categoryId)) {
        bookingsByCategory[monthKey]![categoryId] = [];
      }

      bookingsByCategory[monthKey]![categoryId]!.add(booking);
    }

    List<BookingPeriod> models = [];
    DateTime startDate = bookings.map((booking) => booking.bookingDate).reduce((earliest, date) => date.isBefore(earliest) ? date : earliest);
    DateTime endDate = DateTime.now();
    DateTime currentMonth = DateTime(startDate.year, startDate.month);

    while (currentMonth.isBefore(endDate) || currentMonth.isAtSameMomentAs(endDate)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;

      if (!bookingsByCategory.containsKey(monthKey)) {
        final periodFilter = BookingViewFilter(period: PeriodMode.month, dateTime: currentMonth);
        models.insert(
          0,
          BookingPeriod(filter: periodFilter, income: Decimal.zero, outcome: Decimal.zero, categoryGroups: []),
        );
      } else {
        final DateTime month = DateTime.fromMillisecondsSinceEpoch(monthKey);
        List<CategoryGroup> groupModels = [];

        bookingsByCategory[monthKey]?.forEach((categoryId, bookings) {
          // final category = _bookingConverter.findCategory(categories, categoryId);
          // final bookings = _bookingConverter.fromDataModels(dataModels, category, accounts);
          final amount = bookings.totalAmount;
          groupModels.add(CategoryGroup(category: bookings[0].category, bookings: bookings, amount: amount));
        });
        // List<CategoryGroup> groupModels = [];

        groupModels.sort((a, b) {
          final typeComparison = a.category.categoryType.index.compareTo(b.category.categoryType.index);

          // Sort by amount in descending order
          final amountComparison = b.amount.compareTo(a.amount);

          if (typeComparison != 0) {
            return typeComparison; // First, sort by category type
          } else if (amountComparison != 0) {
            return amountComparison; // If category types are the same, sort by amount
          } else {
            // If both category type and amount are the same, sort by category name
            final nameA = a.category.name ?? "";
            final nameB = b.category.name ?? "";
            return nameA.compareTo(nameB);
          }
        });

        final income = groupModels.incomeCategories().totalAmount;
        final outcome = groupModels.outcomeCategories().totalAmount;

        final periodFilter = BookingViewFilter(period: PeriodMode.month, dateTime: month);

        models.insert(
          0,
          BookingPeriod(
            filter: periodFilter,
            income: income,
            outcome: outcome,
            categoryGroups: groupModels,
          ),
        );
      }
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return models;
  }

  List<BookingPeriod> _convertToYear(List<Booking> bookings) {
    return _convertToAll(bookings);
  }

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
