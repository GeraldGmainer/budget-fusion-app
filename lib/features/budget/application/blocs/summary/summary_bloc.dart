import 'package:bloc/bloc.dart';
import 'package:budget_fusion_app/features/budget/domain/domain.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'summary_bloc.freezed.dart';
part 'summary_event.dart';
part 'summary_state.dart';

@injectable
class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  final ChartDataService _chartDataService;

  SummaryBloc(this._chartDataService) : super(const SummaryState.initial()) {
    on<SummaryEvent>((event, emit) async {
      await event.when(refresh: (items) => _onRefresh(emit, items));
    });
  }

  Future<void> _onRefresh(Emitter<SummaryState> emit, List<BookingPageData> datas) async {
    try {
      final items = await _chartDataService.convert(datas);
      if (items.isEmpty) {
        emit(SummaryState.empty());
      } else {
        emit(SummaryState.loaded(items: items));
      }
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("Error while refreshing SummaryBloc", e, stackTrace);
      final List<ChartViewData> currentItems = state.maybeWhen(loaded: (items) => items, loading: (items, _) => items, orElse: () => []);
      emit(SummaryState.error(items: currentItems, message: e.toString()));
    }
  }
}
