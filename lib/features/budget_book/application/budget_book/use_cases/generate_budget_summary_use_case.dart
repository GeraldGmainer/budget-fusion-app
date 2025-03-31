import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/entities/category_group.dart';
import '../../../domain/entities/category_view_summary_data.dart';
import '../../../domain/entities/pie_data.dart';
import '../../../domain/entities/summary_view_data.dart';

// TODO refactoring
@lazySingleton
class GenerateBudgetSummaryUseCase {
  final ProfileSettingRepo _profileSettingRepo;

  GenerateBudgetSummaryUseCase(this._profileSettingRepo);

  Future<List<SummaryViewData>> call(List<BudgetPageData> datas) async {
    final currency = (await _profileSettingRepo.watch().first).currency;
    return datas.map((data) => _convert(data, currency)).toList();
  }

  SummaryViewData _convert(BudgetPageData pageData, Currency currency) {
    List<CategoryViewSummaryData> summaries = _mapSummaries(pageData, currency);
    List<PieData> pieData = _generatePieData(summaries);

    return SummaryViewData(
      currency: currency,
      categoryType: pageData.categoryGroups.first.category.categoryType,
      dateRange: pageData.dateRange,
      pieData: pieData,
      summaries: summaries,
      income: pageData.income,
      outcome: pageData.outcome,
    );
  }

  List<CategoryViewSummaryData> _mapSummaries(BudgetPageData pageData, Currency currency) {
    final List<CategoryViewSummaryData> summaries = [];
    final List<CategoryGroup> sortedGroups = List.from(pageData.categoryGroups);

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
