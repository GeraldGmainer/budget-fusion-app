import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'summary_bloc.freezed.dart';
part 'summary_event.dart';
part 'summary_state.dart';

@injectable
class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ChartDataService _chartDataService;

  SummaryBloc(this._chartDataService) : super(const SummaryState.initial()) {
    on<SummaryEvent>((event, emit) async {
      await event.when(
        load: (periods) => _onLoad(emit, periods),
      );
    });
  }

  Future<void> _onLoad(Emitter<SummaryState> emit, List<BookingPeriod> periods) async {
    try {
      emit(SummaryState.loading());
      List<ChartViewData> charts = [];
      for (var period in periods) {
        final chart = await _chartDataService.calculate(period);
        charts.add(chart);
      }
      if (charts.isEmpty) {
        emit(SummaryState.empty());
      } else {
        emit(SummaryState.loaded(charts));
      }
    } on TranslatedException catch (e) {
      BudgetLogger.instance.e(e);
      emit(SummaryState.error(e.message));
    } catch (e) {
      BudgetLogger.instance.e(e);
      emit(SummaryState.error("error.default"));
    }
  }
}
