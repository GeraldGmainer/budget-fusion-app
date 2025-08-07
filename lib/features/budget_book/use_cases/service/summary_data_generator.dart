import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../data_managers/booking/booking.dart';
import '../../../../data_managers/category/category.dart';
import '../../../../data_managers/currency/currency.dart';
import '../../view_models/budget_page_data.dart';
import '../../view_models/category_group.dart';
import '../../view_models/category_view_summary_data.dart';
import '../../view_models/pie_data.dart';
import '../../view_models/summary_view_data.dart';

@lazySingleton
class SummaryDataGenerator {
  SummaryViewData generate(BudgetPageData pageData, List<Category> categories) {
    final summaries = _mapSummaries(pageData, categories);
    final pieData = _generatePieData(summaries);
    return SummaryViewData(dateRange: pageData.dateRange, pieData: pieData, summaries: summaries, income: pageData.income, outcome: pageData.outcome);
  }

  List<CategoryViewSummaryData> _mapSummaries(BudgetPageData pageData, List<Category> categories) {
    final categoryGroups = _generateCategoryGroups(pageData.bookings, categories);

    categoryGroups.sort((a, b) {
      if (a.category.categoryType != b.category.categoryType) {
        return a.category.categoryType.index.compareTo(b.category.categoryType.index);
      }
      return b.totalGroupAmount.compareTo(a.totalGroupAmount);
    });

    return categoryGroups
        .map((group) {
          final overall = group.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
          return _convertGroup(group, overall);
        })
        .where((s) => !s.money.isZero())
        .toList();
  }

  List<CategoryGroup> _generateCategoryGroups(List<Booking> bookings, List<Category> categories) {
    final Map<Uuid, List<Booking>> bookingsByCatId = {};

    for (final b in bookings) {
      final cat = b.category;
      bookingsByCatId.putIfAbsent(cat.id, () => []).add(b);
    }

    final Map<Uuid, Money> amountByCatId = {};
    for (final booking in bookings) {
      amountByCatId.update(booking.category.id, (value) => value + booking.money, ifAbsent: () => booking.money);
    }

    final List<CategoryGroup> topGroups = [];
    for (final parentCategory in categories.where((c) => c.isParent)) {
      final List<CategoryGroup> subGroups = [];
      for (final subcategory in parentCategory.subcategories) {
        final childBookings = bookingsByCatId[subcategory.id] ?? [];
        if (amountByCatId.containsKey(subcategory.id)) {
          final childAmount = amountByCatId[subcategory.id]!;
          subGroups.add(CategoryGroup(category: subcategory, bookings: childBookings, money: childAmount));
        }
      }

      subGroups.sort(_compareCategoryGroups);

      final parentBookings = bookingsByCatId[parentCategory.id] ?? [];
      final parentAmount = amountByCatId[parentCategory.id] ?? Money.zero();

      if (parentBookings.isNotEmpty || subGroups.isNotEmpty) {
        topGroups.add(CategoryGroup(category: parentCategory, bookings: parentBookings, money: parentAmount, subGroups: subGroups));
      }
    }

    topGroups.sort(_compareCategoryGroups);
    return topGroups;
  }

  int _compareCategoryGroups(CategoryGroup a, CategoryGroup b) {
    final typeCmp = a.category.categoryType.index.compareTo(b.category.categoryType.index);
    if (typeCmp != 0) return typeCmp;
    return b.totalGroupAmount.compareTo(a.totalGroupAmount); // Use totalGroupAmount for sorting
  }

  CategoryViewSummaryData _convertGroup(CategoryGroup group, Money overallTotal) {
    final Money groupTotalAmount = group.totalGroupAmount; // Use the combined amount for the group
    final double percentage = overallTotal.isZero() ? 0 : ((groupTotalAmount.amount / overallTotal.amount).toDouble() * 100).roundToDouble();
    final List<CategoryViewSummaryData> subSummaries = group.subGroups.map((sub) => _convertGroup(sub, overallTotal)).toList()..sort((a, b) => b.money.compareTo(a.money));
    final bool isSynced = (group.bookings.where((x) => !x.isSynced).isEmpty) && subSummaries.every((sub) => sub.isSynced);

    return CategoryViewSummaryData(
      categoryType: group.category.categoryType,
      categoryName: group.category.name,
      parentCategoryName: group.category.parent?.name,
      iconName: group.category.iconName,
      iconColor: group.category.iconColor,
      percentage: percentage.toInt(),
      money: groupTotalAmount,
      subSummaries: subSummaries,
      isSynced: isSynced,
    );
  }

  List<PieData> _generatePieData(List<CategoryViewSummaryData> summaries) {
    return summaries.where((s) => s.categoryType == CategoryType.outcome).map((s) {
      final hideIcon = s.percentage < FeatureConstants.hideIconInPiePercent;
      return PieData(
        xData: s.categoryName,
        yData: s.money.amount.toDouble(),
        text: hideIcon ? null : s.categoryName,
        iconName: s.iconName,
        iconColor: s.iconColor,
        hideIcon: hideIcon,
      );
    }).toList();
  }
}
