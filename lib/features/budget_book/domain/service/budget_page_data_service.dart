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
  final CategoryRepo _categoryRepo;

  BudgetPageDataService(this._categoryRepo);

  Future<List<BudgetPageData>> load(List<Booking> bookings, BudgetBookFilter filter) async {
    if (bookings.isEmpty) {
      return [BudgetPageData.empty(filter.period)];
    }

    switch (filter.period) {
      case PeriodMode.day:
        return _convertToDay(bookings);
      case PeriodMode.month:
        return await _convertToMonth(bookings);
      case PeriodMode.year:
        return _convertToYear(bookings);
      case PeriodMode.all:
        return _convertToAll(bookings);
    }
  }

  Future<List<BudgetPageData>> _convertToMonth(List<Booking> bookings) async {
    final bookingsByMonthAndCategory = _groupBookingsByMonthAndCategory(bookings);
    DateTime fromDate = bookings.map((booking) => booking.date).reduce((a, b) => a.isBefore(b) ? a : b);
    DateTime endDate = bookings.map((booking) => booking.date).reduce((a, b) => a.isAfter(b) ? a : b);
    return await _generateMonthlyPeriods(fromDate, endDate, bookingsByMonthAndCategory);
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

  Future<List<BudgetPageData>> _generateMonthlyPeriods(DateTime from, DateTime end, Map<int, Map<String, List<Booking>>> bookingsByMonthAndCategory) async {
    final periods = <BudgetPageData>[];
    DateTime currentMonth = from.startOfMonth;

    while (!currentMonth.isAfter(end)) {
      final monthKey = currentMonth.millisecondsSinceEpoch;
      final toDate = currentMonth.endOfMonth;

      if (!bookingsByMonthAndCategory.containsKey(monthKey)) {
        periods.add(BudgetPageData.empty(PeriodMode.month));
      } else {
        final categoryGroups = await _createCategoryGroups(bookingsByMonthAndCategory[monthKey]!);
        periods.add(BudgetPageData(
          dateRange: BudgetDateRange(period: PeriodMode.month, from: currentMonth, to: toDate),
          income: categoryGroups.totalIncomeAmount(),
          outcome: categoryGroups.totalOutcomeAmount(),
          categoryGroups: categoryGroups,
        ));
      }

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return periods;
  }

  Future<List<CategoryGroup>> _createCategoryGroups(Map<String, List<Booking>> bookingsByCategory) async {
    final flatCategories = await _categoryRepo.watch().first;
    final Map<String, Category> flatMap = {for (var cat in flatCategories) cat.id.toString(): cat};

    final Map<String, CategoryGroup> groupMap = {};
    for (final entry in bookingsByCategory.entries) {
      final category = entry.value.first.category;
      if (category == null) continue;
      final amount = entry.value.fold(Decimal.zero, (sum, booking) => sum + booking.amount);
      groupMap[category.id.toString()] = CategoryGroup(
        category: category,
        bookings: entry.value,
        amount: amount,
        subGroups: [],
      );
    }

    final Set<String> nestedGroupIds = {};

    for (final entry in groupMap.entries.toList()) {
      final id = entry.key;
      final group = entry.value;
      if (group.category.parent != null) {
        final parentId = group.category.parent!.id.toString();
        final parentFromRepo = flatMap[parentId];
        if (parentFromRepo == null) {
          BudgetLogger.instance.e("No group found for ID $parentId / ${group.category}", "Parent category not found");
          continue;
        }
        if (!groupMap.containsKey(parentId)) {
          groupMap[parentId] = CategoryGroup(
            category: parentFromRepo,
            bookings: [],
            amount: Decimal.zero,
            subGroups: [],
          );
        }
        final parentGroup = groupMap[parentId]!;
        final updatedSubGroups = List<CategoryGroup>.from(parentGroup.subGroups)..add(group);
        groupMap[parentId] = parentGroup.copyWith(subGroups: updatedSubGroups);
        nestedGroupIds.add(id);
      }
    }

    // Build top-level groups (i.e. those not nested).
    final List<CategoryGroup> topLevelGroups = groupMap.entries.where((entry) => !nestedGroupIds.contains(entry.key)).map((entry) => entry.value).toList();

    topLevelGroups.sort(_compareCategoryGroups);
    return topLevelGroups;
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
