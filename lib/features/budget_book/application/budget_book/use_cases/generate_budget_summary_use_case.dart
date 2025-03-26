import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/budget_page_data.dart';
import '../../../domain/entities/category_view_summary.dart';
import '../../../domain/entities/pie_data.dart';
import '../../../domain/entities/summary_view_data.dart';

@lazySingleton
class GenerateBudgetSummaryUseCase {
  List<SummaryViewData> call(List<BudgetPageData> datas, Currency currency) {
    return datas.map((data) => _convert(data, currency)).toList();
  }

  SummaryViewData _convert(BudgetPageData pageData, Currency currency) {
    List<CategoryViewSummary> summaries = _mapSummaries(pageData);
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

  List<CategoryViewSummary> _mapSummaries(BudgetPageData pageData) {
    final Map<Category, Decimal> categoryTotals = {};
    for (final booking in pageData.bookings) {
      if (booking.category != null) {
        final currentSum = categoryTotals[booking.category] ?? Decimal.zero;
        categoryTotals[booking.category!] = currentSum + booking.amount;
      }
    }

    final List<CategoryViewSummary> summaries = [];
    categoryTotals.forEach((category, totalForCategory) {
      final totalPool = category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
      final percentage = totalPool == Decimal.zero ? 0 : ((totalForCategory / totalPool).toDouble() * 100.0).round();

      summaries.add(
        CategoryViewSummary(
          categoryName: category.name,
          iconName: category.iconName,
          iconColor: category.iconColor,
          percentage: percentage,
          value: totalForCategory,
        ),
      );
    });

    return summaries;
  }

  List<PieData> _generatePieData(List<CategoryViewSummary> summaries) {
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
