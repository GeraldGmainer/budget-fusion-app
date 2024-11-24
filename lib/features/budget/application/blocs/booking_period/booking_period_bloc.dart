import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'booking_period_bloc.freezed.dart';
part 'booking_period_event.dart';
part 'booking_period_state.dart';

@injectable
class BookingPeriodBloc extends Bloc<BookingPeriodEvent, BookingPeriodState> {
  final BudgetBookAggregator _budgetBookAggregator;

  BookingPeriodBloc(this._budgetBookAggregator) : super(const BookingPeriodState.initial()) {
    on<BookingPeriodEvent>((event, emit) async {
      await event.when(
        load: (period) => _onLoad(emit, period),
      );
    });
  }

  Future<void> _onLoad(Emitter<BookingPeriodState> emit, PeriodMode period) async {
    try {
      emit(BookingPeriodState.loading());
      final stopwatch = Stopwatch()..start();
      final accountGroups = await _budgetBookAggregator.getAccountGroups(period);
      stopwatch.stop();
      BudgetLogger.instance.d("loading BookingPeriodBloc took ${stopwatch.elapsed.inMilliseconds} ms");
      emit(BookingPeriodState.loaded(accountGroups));
    } on TranslatedException catch (e, stackTrace) {
      BudgetLogger.instance.e("BookingPeriodBloc Exception", e, stackTrace);
      emit(BookingPeriodState.error(e.message));
    } catch (e, stackTrace) {
      BudgetLogger.instance.e("BookingPeriodBloc Exception", e, stackTrace);
      emit(const BookingPeriodState.error("error.default"));
    }
  }
}
