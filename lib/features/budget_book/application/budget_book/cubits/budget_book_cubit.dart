import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/domain/entities/budget_page_data.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/base/budget_view_data.dart';
import '../../../domain/entities/budget_book_filter.dart';
import '../../../domain/enums/budget_view_mode.dart';
import '../../../domain/enums/period_mode.dart';
import '../use_cases/filter_and_group_bookings_use_case.dart';
import '../use_cases/generate_budget_summary_use_case.dart';
import '../use_cases/generate_budget_transaction_use_case.dart';
import '../use_cases/reset_budget_book_use_case.dart';

part 'budget_book_cubit.freezed.dart';
part 'budget_book_state.dart';

@injectable
class BudgetBookCubit extends Cubit<BudgetBookState> {
  final FilterAndGroupBookingsUseCase _filterAndGroupBookingsUseCase;
  final GenerateBudgetSummaryUseCase _generateBudgetSummaryUseCase;
  final GenerateBudgetTransactionUseCase _generateBudgetTransactionUseCase;
  final WatchBookingsUseCase _watchBookingsUseCase;
  final ResetBudgetBookUseCase _resetBudgetBookUseCase;

  StreamSubscription<List<Booking>>? _bookingSub;

  BudgetBookCubit(
    this._generateBudgetSummaryUseCase,
    this._filterAndGroupBookingsUseCase,
    this._watchBookingsUseCase,
    this._resetBudgetBookUseCase,
    this._generateBudgetTransactionUseCase,
  ) : super(BudgetBookState.initial(
          filter: BudgetBookFilter.initial(),
          period: PeriodMode.month,
        )) {
    _subscribeToBookings();
  }

  void _subscribeToBookings() {
    _bookingSub?.cancel();
    _bookingSub = _watchBookingsUseCase().listen(_onBookings);
  }

  Future<void> _onBookings(List<Booking> rawBookingList) async {
    try {
      final filtered = await _filterAndGroupBookingsUseCase(rawBookingList, state.filter);
      final items = await _generateViewData(filtered, state.viewMode);

      emit(BudgetBookState.loaded(
        items: items,
        filter: state.filter,
        viewMode: state.viewMode,
        period: state.period,
        initialLoaded: true,
      ));
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} onBookings TranslatedException", e, stack);
      emit(BudgetBookState.fromError(message: e.message, state: state));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} onBookings Exception", e, stack);
      emit(BudgetBookState.fromError(message: 'error.default', state: state));
    }
  }

  Future<List<BudgetViewData>> _generateViewData(List<BudgetPageData> filtered, BudgetViewMode viewMode) async {
    switch (viewMode) {
      case BudgetViewMode.summary:
        return await _generateBudgetSummaryUseCase(filtered);
      case BudgetViewMode.transaction:
        return await _generateBudgetTransactionUseCase(filtered);
      case BudgetViewMode.calendar:
        return [];
    }
  }

  Future<void> updateView({BudgetBookFilter? filter, BudgetViewMode? viewMode, bool initialLoad = true}) async {
    try {
      final newViewMode = viewMode ?? state.viewMode;
      final newFilter = filter ?? state.filter;
      DomainLogger.instance.d(runtimeType.toString(), "update view for budget book: $newViewMode / $newFilter");

      final bookings = await _watchBookingsUseCase().first;
      final filtered = await _filterAndGroupBookingsUseCase(bookings, newFilter);
      final items = await _generateViewData(filtered, newViewMode);

      state.maybeWhen(loaded: (_, __, ___, ____, _____) {
        emit(BudgetBookState.loaded(
          items: items,
          filter: newFilter,
          viewMode: newViewMode,
          period: state.period,
          initialLoaded: initialLoad,
        ));
      }, orElse: () {
        emit(state.copyWith(
          items: items,
          filter: newFilter,
          viewMode: newViewMode,
        ));
      });
    } on TranslatedException catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} updateView TranslatedException", e, stack);
      emit(BudgetBookState.fromError(message: e.message, state: state));
    } catch (e, stack) {
      BudgetLogger.instance.e("${runtimeType.toString()} updateView Exception", e, stack);
      emit(BudgetBookState.fromError(message: 'error.default', state: state));
    }
  }

  Future<void> resetAndLoad() async {
    DomainLogger.instance.d(runtimeType.toString(), "reset and load for budget book: ${state.viewMode} / ${state.filter}");
    emit(BudgetBookState.loading(items: [], filter: state.filter, viewMode: state.viewMode, period: state.period));
    await _resetBudgetBookUseCase();
  }

  @override
  Future<void> close() async {
    await _bookingSub?.cancel();
    return super.close();
  }
}
