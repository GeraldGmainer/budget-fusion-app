import 'package:budget_fusion_app/core/core.dart';
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
    final summaries = _mapSummaries(pageData, currency, flatCategories);
    final pieData = _generatePieData(summaries);

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
    final categoryGroups = _generateCategoryGroups(pageData.bookings, flatCategories);

    categoryGroups.sort((a, b) {
      if (a.category.categoryType != b.category.categoryType) {
        return a.category.categoryType.index.compareTo(b.category.categoryType.index);
      }
      return b.totalGroupAmount.compareTo(a.totalGroupAmount);
    });

    return categoryGroups.map((group) {
      final overall = group.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
      return _convertGroup(group, overall, currency);
    }).toList();
  }

  List<CategoryGroup> _generateCategoryGroups(List<Booking> bookings, List<Category> flatCategories) {
    final Map<Uuid, List<Booking>> bookingsByCat = {};

    for (final b in bookings) {
      final cat = b.category;
      if (cat == null) {
        continue;
      }
      bookingsByCat.putIfAbsent(cat.id, () => []).add(b);
    }

    final Map<Uuid, Decimal> amountByCat = {
      for (var e in bookingsByCat.entries) e.key: e.value.fold(Decimal.zero, (sum, b) => sum + b.amount),
    };

    final List<CategoryGroup> topGroups = [];
    for (final parent in flatCategories.where((c) => c.isParent)) {
      final parentBookings = bookingsByCat[parent.id] ?? [];
      final parentAmount = amountByCat[parent.id] ?? Decimal.zero;

      final List<CategoryGroup> subGroups = parent.subcategories.map((child) {
        final childBookings = bookingsByCat[child.id] ?? [];
        final childAmount = amountByCat[child.id] ?? Decimal.zero;
        return CategoryGroup(category: child, bookings: childBookings, amount: childAmount);
      }).toList()
        ..sort(_compareCategoryGroups);

      if (parentBookings.isEmpty && subGroups.isEmpty) continue;

      topGroups.add(CategoryGroup(category: parent, bookings: parentBookings, amount: parentAmount, subGroups: subGroups));
    }

    topGroups.sort(_compareCategoryGroups);
    return topGroups;
  }

  int _compareCategoryGroups(CategoryGroup a, CategoryGroup b) {
    final typeCmp = a.category.categoryType.index.compareTo(b.category.categoryType.index);
    if (typeCmp != 0) return typeCmp;
    return b.amount.compareTo(a.amount);
  }

  CategoryViewSummaryData _convertGroup(CategoryGroup group, Decimal overallTotal, Currency currency) {
    if (group.subGroups.isEmpty) {
      final perc = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
      final isSynced = group.bookings.where((x) => !x.isSynced).isEmpty;
      return CategoryViewSummaryData(
        currency: currency,
        categoryType: group.category.categoryType,
        categoryName: group.category.name,
        parentCategoryName: group.category.parent?.name,
        iconName: group.category.iconName,
        iconColor: group.category.iconColor,
        percentage: perc,
        value: group.amount,
        isSynced: isSynced,
      );
    }

    final parentPerc = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
    final subSummaries = group.subGroups.map((sub) => _convertGroup(sub, overallTotal, currency)).toList()..sort((a, b) => b.value.compareTo(a.value));
    final childrenTotal = subSummaries.fold<Decimal>(Decimal.zero, (sum, c) => sum + c.value);
    final childrenPerc = overallTotal == Decimal.zero ? 0 : ((childrenTotal / overallTotal).toDouble() * 100).round();
    final combinedValue = group.amount + childrenTotal;
    final combinedPerc = parentPerc + childrenPerc;
    final isSynced = subSummaries.where((x) => !x.isSynced).isEmpty;

    return CategoryViewSummaryData(
      currency: currency,
      categoryType: group.category.categoryType,
      categoryName: group.category.name,
      parentCategoryName: group.category.parent?.name,
      iconName: group.category.iconName,
      iconColor: group.category.iconColor,
      percentage: combinedPerc,
      value: combinedValue,
      subSummaries: subSummaries,
      isSynced: isSynced,
    );
  }

  List<PieData> _generatePieData(List<CategoryViewSummaryData> summaries) {
    return summaries.where((s) => s.categoryType == CategoryType.outcome).map((s) {
      final hideIcon = s.percentage < 5;
      return PieData(
        xData: s.categoryName,
        yData: s.value.toDouble(),
        text: hideIcon ? null : s.categoryName,
        iconName: s.iconName,
        iconColor: s.iconColor,
        hideIcon: hideIcon,
      );
    }).toList();
  }
}
