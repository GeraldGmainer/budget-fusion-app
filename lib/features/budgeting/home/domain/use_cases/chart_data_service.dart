import 'package:budget_fusion_app/features/budgeting/shared/shared.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';

import '../../home.dart';

@lazySingleton
class ChartDataService {
  final ProfileRepo _profileRepo;

  ChartDataService(this._profileRepo);

  Future<ChartViewData> calculate(BookingPeriod period) async {
    List<CategorySummary> categorySummaries = _mapSummaries(period);
    List<PieData> pieData = _mapToPieData(period.categoryGroups.outcomeCategories(), period.outcome);

    final currency = await _profileRepo.getCurrency();

    return ChartViewData(
      currency: currency,
      period: period,
      pieData: pieData,
      categorySummaries: categorySummaries,
    );
  }

  List<CategorySummary> _mapSummaries(BookingPeriod period) {
    List<CategorySummary> categorySummaries = [];
    for (var categoryGroup in period.categoryGroups) {
      final categoryTotal = categoryGroup.category.categoryType == CategoryType.income ? period.income : period.outcome;
      final amount = categoryGroup.amount;
      categorySummaries.add(
        CategorySummary(
            categoryName: categoryGroup.category.name,
            iconName: categoryGroup.category.iconName,
            iconColor: categoryGroup.category.iconColor,
            percentage: ((amount / categoryTotal).toDouble() * 100.0).round(),
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
