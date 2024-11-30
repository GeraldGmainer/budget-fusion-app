import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../base/period_pagination/period_pagination_bloc.dart';

@injectable
class SummaryBloc extends PeriodPaginationBloc<ChartViewData> {
  final BookingPeriodLoader _budgetBookLoader;
  final ChartDataService _chartDataService;

  SummaryBloc(this._budgetBookLoader, this._chartDataService);

  @override
  Future<List<BookingPeriod>> fetchItems(PeriodMode period, int page) async {
    var items = await _budgetBookLoader.loadPage(period, page);
    return items;
  }

  @override
  Future<List<ChartViewData>> convertItems(List<BookingPeriod> items) async {
    List<ChartViewData> charts = [];
    for (var item in items) {
      final chart = await _chartDataService.calculate(item);
      charts.add(chart);
    }
    return charts;
  }
}
