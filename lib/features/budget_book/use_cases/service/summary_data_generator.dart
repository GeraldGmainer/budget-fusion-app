import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
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

    return categoryGroups.map((group) {
      final overall = group.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
      return _convertGroup(group, overall);
    }).toList();
  }

  List<CategoryGroup> _generateCategoryGroups(List<Booking> bookings, List<Category> categories) {
    final Map<Uuid, List<Booking>> bookingsByCatId = {};

    for (final b in bookings) {
      final cat = b.category;
      bookingsByCatId.putIfAbsent(cat.id, () => []).add(b);
    }

    // Calculate total amount for each category, including subcategories
    final Map<Uuid, Money> amountByCatId = {};
    for (final booking in bookings) {
      // Add booking amount to its immediate category
      amountByCatId.update(booking.category.id, (value) => value + booking.money, ifAbsent: () => booking.money);

      // Also add to parent categories if they exist
      Category? currentCategory = booking.category.parent;
      while (currentCategory != null) {
        amountByCatId.update(currentCategory.id, (value) => value + booking.money, ifAbsent: () => booking.money);
        currentCategory = currentCategory.parent;
      }
    }

    final List<CategoryGroup> topGroups = [];
    // Only process parent categories from the input list
    for (final parentCategory in categories.where((c) => c.isParent)) {
      final List<CategoryGroup> subGroups = [];
      for (final subcategory in parentCategory.subcategories) {
        final childBookings = bookingsByCatId[subcategory.id] ?? [];
        final childAmount = amountByCatId[subcategory.id] ?? Money.zero();
        subGroups.add(CategoryGroup(category: subcategory, bookings: childBookings, money: childAmount));
      }

      subGroups.sort(_compareCategoryGroups);

      final parentBookings = bookingsByCatId[parentCategory.id] ?? [];
      final parentAmount = amountByCatId[parentCategory.id] ?? Money.zero();

      // Only add parent group if it has direct bookings or sub-groups with bookings
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
      final hideIcon = s.percentage < 5;
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

//
// @lazySingleton
// class SummaryDataGenerator {
//   SummaryViewData generate(BudgetPageData pageData, Currency currency, List<Category> flatCategories) {
//     final summaries = _mapSummaries(pageData, currency, flatCategories);
//     final pieData = _generatePieData(summaries);
//
//     return SummaryViewData(currency: currency, dateRange: pageData.dateRange, pieData: pieData, summaries: summaries, income: pageData.income, outcome: pageData.outcome);
//   }
//
//   // TODO dont use flat categories
//   List<CategoryViewSummaryData> _mapSummaries(BudgetPageData pageData, Currency currency, List<Category> flatCategories) {
//     final categoryGroups = _generateCategoryGroups(pageData.bookings, flatCategories);
//
//     categoryGroups.sort((a, b) {
//       if (a.category.categoryType != b.category.categoryType) {
//         return a.category.categoryType.index.compareTo(b.category.categoryType.index);
//       }
//       return b.totalGroupAmount.compareTo(a.totalGroupAmount);
//     });
//
//     return categoryGroups.map((group) {
//       final overall = group.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
//       return _convertGroup(group, overall, currency);
//     }).toList();
//   }
//
//   List<CategoryGroup> _generateCategoryGroups(List<Booking> bookings, List<Category> flatCategories) {
//     final Map<Uuid, List<Booking>> bookingsByCat = {};
//
//     for (final b in bookings) {
//       final cat = b.category;
//       if (cat == null) {
//         continue;
//       }
//       bookingsByCat.putIfAbsent(cat.id, () => []).add(b);
//     }
//
//     final Map<Uuid, Decimal> amountByCat = {for (var e in bookingsByCat.entries) e.key: e.value.fold(Decimal.zero, (sum, b) => sum + b.amount)};
//
//     final List<CategoryGroup> topGroups = [];
//     for (final parent in flatCategories.where((c) => c.isParent)) {
//       final parentBookings = bookingsByCat[parent.id] ?? [];
//       final parentAmount = amountByCat[parent.id] ?? Decimal.zero;
//
//       final List<CategoryGroup> subGroups =
//           parent.subcategories.map((child) {
//               final childBookings = bookingsByCat[child.id] ?? [];
//               final childAmount = amountByCat[child.id] ?? Decimal.zero;
//               return CategoryGroup(category: child, bookings: childBookings, amount: childAmount);
//             }).toList()
//             ..sort(_compareCategoryGroups);
//
//       if (parentBookings.isEmpty && subGroups.isEmpty) continue;
//
//       topGroups.add(CategoryGroup(category: parent, bookings: parentBookings, amount: parentAmount, subGroups: subGroups));
//     }
//
//     topGroups.sort(_compareCategoryGroups);
//     return topGroups;
//   }
//
//   int _compareCategoryGroups(CategoryGroup a, CategoryGroup b) {
//     final typeCmp = a.category.categoryType.index.compareTo(b.category.categoryType.index);
//     if (typeCmp != 0) return typeCmp;
//     return b.amount.compareTo(a.amount);
//   }
//
//   CategoryViewSummaryData _convertGroup(CategoryGroup group, Decimal overallTotal, Currency currency) {
//     if (group.subGroups.isEmpty) {
//       final perc = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
//       final isSynced = group.bookings.where((x) => !x.isSynced).isEmpty;
//       return CategoryViewSummaryData(
//         currency: currency,
//         categoryType: group.category.categoryType,
//         categoryName: group.category.name,
//         parentCategoryName: group.category.parent?.name,
//         iconName: group.category.iconName,
//         iconColor: group.category.iconColor,
//         percentage: perc,
//         value: group.amount,
//         isSynced: isSynced,
//       );
//     }
//
//     final parentPerc = overallTotal == Decimal.zero ? 0 : ((group.amount / overallTotal).toDouble() * 100).round();
//     final subSummaries = group.subGroups.map((sub) => _convertGroup(sub, overallTotal, currency)).toList()..sort((a, b) => b.value.compareTo(a.value));
//     final childrenTotal = subSummaries.fold<Decimal>(Decimal.zero, (sum, c) => sum + c.value);
//     final childrenPerc = overallTotal == Decimal.zero ? 0 : ((childrenTotal / overallTotal).toDouble() * 100).round();
//     final combinedValue = group.amount + childrenTotal;
//     final combinedPerc = parentPerc + childrenPerc;
//     final isSynced = subSummaries.where((x) => !x.isSynced).isEmpty;
//
//     return CategoryViewSummaryData(
//       currency: currency,
//       categoryType: group.category.categoryType,
//       categoryName: group.category.name,
//       parentCategoryName: group.category.parent?.name,
//       iconName: group.category.iconName,
//       iconColor: group.category.iconColor,
//       percentage: combinedPerc,
//       value: combinedValue,
//       subSummaries: subSummaries,
//       isSynced: isSynced,
//     );
//   }
//
//   List<PieData> _generatePieData(List<CategoryViewSummaryData> summaries) {
//     return summaries.where((s) => s.categoryType == CategoryType.outcome).map((s) {
//       final hideIcon = s.percentage < 5;
//       return PieData(xData: s.categoryName, yData: s.value.toDouble(), text: hideIcon ? null : s.categoryName, iconName: s.iconName, iconColor: s.iconColor, hideIcon: hideIcon);
//     }).toList();
//   }
// }
