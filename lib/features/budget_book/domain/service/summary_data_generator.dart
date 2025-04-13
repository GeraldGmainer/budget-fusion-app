import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../entities/budget_page_data.dart';
import '../entities/category_group.dart';
import '../entities/category_view_summary_data.dart';
import '../entities/pie_data.dart';
import '../entities/summary_view_data.dart';

@lazySingleton
class SummaryDataGenerator {
  SummaryViewData generate(BudgetPageData pageData, Currency currency, List<Category> flatCategories) {
    List<CategoryViewSummaryData> summaries = _mapSummaries(pageData, currency, flatCategories);
    List<PieData> pieData = _generatePieData(summaries);

    return SummaryViewData(
      currency: currency,
      dateRange: pageData.dateRange,
      pieData: pieData,
      summaries: summaries,
      income: pageData.income,
      outcome: pageData.outcome,
    );
  }

  List<CategoryViewSummaryData> _mapSummaries(BudgetPageData pageData, Currency currency, List<Category> flatCategories) {
    final List<CategoryViewSummaryData> summaries = [];
    final List<CategoryGroup> categoryGroups = _generateCategoryGroups(pageData.bookings, flatCategories);
    final List<CategoryGroup> sortedGroups = List.from(categoryGroups);

    sortedGroups.sort((a, b) {
      if (a.category.categoryType != b.category.categoryType) {
        return a.category.categoryType.index.compareTo(b.category.categoryType.index);
      } else {
        return b.totalGroupAmount.compareTo(a.totalGroupAmount);
      }
    });

    for (final group in sortedGroups) {
      final Decimal overallTotal = group.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
      summaries.add(_convertGroup(group, overallTotal, currency));
    }
    return summaries;
  }

  List<CategoryGroup> _generateCategoryGroups(List<Booking> bookings, List<Category> flatCategories) {
    final bookingsByMonthAndCategory = _groupBookingsByMonthAndCategory(bookings);
    return _createCategoryGroups(bookingsByMonthAndCategory, flatCategories);
  }

  Map<String, List<Booking>> _groupBookingsByMonthAndCategory(List<Booking> bookings) {
    final Map<String, List<Booking>> grouped = {};

    for (var booking in bookings) {
      if (booking.category == null) {
        BudgetLogger.instance.e("Null Category", "Category is NULL for booking: $booking");
        continue;
      }
      grouped.putIfAbsent(booking.category!.id.toString(), () => []);
      grouped[booking.category!.id.toString()]!.add(booking);
    }
    return grouped;
  }

  List<CategoryGroup> _createCategoryGroups(Map<String, List<Booking>> bookingsByCategory, List<Category> flatCategories) {
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

    final List<CategoryGroup> topLevelGroups = groupMap.entries.where((entry) => !nestedGroupIds.contains(entry.key)).map((entry) => entry.value).toList();

    topLevelGroups.sort(_compareCategoryGroups);
    return topLevelGroups;
  }

  int _compareCategoryGroups(CategoryGroup a, CategoryGroup b) {
    final typeComparison = a.category.categoryType.index.compareTo(b.category.categoryType.index);
    final amountComparison = b.amount.compareTo(a.amount);
    return typeComparison != 0 ? typeComparison : amountComparison;
  }

  CategoryViewSummaryData _convertGroup(CategoryGroup group, Decimal overallTotal, Currency currency) {
    if (group.subGroups.isEmpty) {
      int percentage = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
      return CategoryViewSummaryData(
        currency: currency,
        categoryType: group.category.categoryType,
        categoryName: group.category.name,
        parentCategoryName: group.category.parent?.name,
        iconName: group.category.iconName,
        iconColor: group.category.iconColor,
        percentage: percentage,
        value: group.amount,
      );
    } else {
      int parentPerc = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
      List<CategoryViewSummaryData> subSummaries = group.subGroups.map((child) => _convertGroup(child, overallTotal, currency)).toList();
      subSummaries.sort((a, b) {
        return b.value.compareTo(a.value);
      });
      Decimal childrenTotal = subSummaries.fold(Decimal.zero, (prev, child) => prev + child.value);
      int childrenPerc = overallTotal == Decimal.zero ? 0 : ((childrenTotal / overallTotal).toDouble() * 100).round();
      int totalPercentage = parentPerc + childrenPerc;
      Decimal combinedValue = group.amount + childrenTotal;
      return CategoryViewSummaryData(
        currency: currency,
        categoryType: group.category.categoryType,
        categoryName: group.category.name,
        parentCategoryName: group.category.parent?.name,
        iconName: group.category.iconName,
        iconColor: group.category.iconColor,
        percentage: totalPercentage,
        value: combinedValue,
        subSummaries: subSummaries,
      );
    }
  }

  List<PieData> _generatePieData(List<CategoryViewSummaryData> summaries) {
    List<PieData> pieDataList = [];
    for (final summary in summaries) {
      if (summary.categoryType == CategoryType.income) {
        continue;
      }
      final hideIcon = summary.percentage < 5;
      pieDataList.add(
        PieData(
          xData: summary.categoryName,
          yData: summary.value.toDouble(),
          text: hideIcon ? null : summary.categoryName,
          iconName: summary.iconName,
          iconColor: summary.iconColor,
          hideIcon: hideIcon,
        ),
      );
    }
    return pieDataList;
  }
}
