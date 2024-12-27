import 'package:budget_fusion_app/core/core.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../domain.dart';

@lazySingleton
class SummaryAggregator {
  final ProfileRepo _profileRepo;

  SummaryAggregator(this._profileRepo);

  Future<List<SummaryViewData>> convert(List<BookingPageData> datas) async {
    return await Future.wait(datas.map((data) => _convert(data)));
  }

  Future<SummaryViewData> _convert(BookingPageData pageData) async {
    List<CategorySummary> categorySummaries = _mapSummaries(pageData);
    List<PieData> pieData = _mapToPieData(pageData.categoryGroups.outcomeCategories(), pageData.outcome);

    final currency = await _profileRepo.getCurrency();

    return SummaryViewData(
      currency: currency,
      dateRange: pageData.dateRange,
      pieData: pieData,
      categorySummaries: categorySummaries,
      income: pageData.income,
      outcome: pageData.outcome,
    );
  }

  List<CategorySummary> _mapSummaries(BookingPageData pageData) {
    List<CategorySummary> categorySummaries = [];
    for (var categoryGroup in pageData.categoryGroups) {
      final categoryTotal = categoryGroup.category.categoryType == CategoryType.income ? pageData.income : pageData.outcome;
      final amount = categoryGroup.amount;
      categorySummaries.add(
        CategorySummary(
            categoryName: categoryGroup.category.name,
            iconName: categoryGroup.category.iconName,
            iconColor: categoryGroup.category.iconColor,
            percentage: categoryTotal == Decimal.zero ? 0 : ((amount / categoryTotal).toDouble() * 100.0).round(),
            value: amount),
      );
    }
    return categorySummaries;
  }

  List<PieData> _mapToPieData(List<CategoryGroup> groups, Decimal total) {
    List<PieData> pieDataList = [];

    for (var group in groups) {
      final category = group.category;
      final categoryName = category.name.isNotEmpty ? category.name : "Unknown";
      final amount = group.bookings.totalAmount.toDouble();
      final hideIcon = amount / total.toDouble() < 0.05;

      pieDataList.add(
        PieData(
          xData: categoryName,
          yData: amount,
          text: hideIcon ? null : category.name,
          iconColor: category.iconColor,
          iconName: category.iconName,
          hideIcon: hideIcon,
        ),
      );
    }

    return pieDataList;
  }
}
