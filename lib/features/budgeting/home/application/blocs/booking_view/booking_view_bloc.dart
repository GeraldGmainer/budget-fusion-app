import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../home.dart';

part 'booking_view_bloc.freezed.dart';
part 'booking_view_event.dart';
part 'booking_view_state.dart';

@injectable
class BookingViewBloc extends Bloc<BookingViewEvent, BookingViewState> {
  final ChartDataService _chartDataService;

  BookingViewBloc(this._chartDataService) : super(const BookingViewState.initial()) {
    on<BookingViewEvent>((event, emit) async {
      await event.when(
        load: (mode, accountGroups) => _onLoad(emit, mode, accountGroups),
      );
    });
  }

  Future<void> _onLoad(Emitter<BookingViewState> emit, ViewMode mode, List<BookingPeriod> periods) async {
    try {
      emit(BookingViewState.loading());
      List<ChartViewData> charts = [];
      for (var period in periods) {
        final chart = await _chartDataService.calculate(period);
        charts.add(chart);
      }
      emit(BookingViewState.chartLoaded(charts));
    } on TranslatedException catch (e) {
      BudgetLogger.instance.e(e);
      emit(BookingViewState.error(e.message));
    } catch (e) {
      BudgetLogger.instance.e(e);
      emit(BookingViewState.error("error.default"));
    }
  }
}
