import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data_managers/booking/booking.dart';
import '../enums/budget_view_mode.dart';
import '../enums/period_mode.dart';
import '../use_cases/filter_and_group_bookings_use_case.dart';
import '../use_cases/generate_budget_summary_use_case.dart';
import '../use_cases/generate_budget_transaction_use_case.dart';
import '../use_cases/reset_budget_book_use_case.dart';
import '../view_models/base/budget_view_data.dart';
import '../view_models/budget_book_filter.dart';
import '../view_models/budget_date_range.dart';
import '../view_models/budget_page_data.dart';

part 'budget_book_cubit.freezed.dart';
part 'budget_book_state.dart';

@injectable
class BudgetBookCubit extends ErrorHandledCubit<BudgetBookState> {
  final BookingDataManager _manager;
  final FilterAndGroupBookingsUseCase _filterAndGroupBookingsUseCase;
  final GenerateBudgetSummaryUseCase _generateBudgetSummaryUseCase;
  final GenerateBudgetTransactionUseCase _generateBudgetTransactionUseCase;
  final ResetBudgetBookUseCase _resetBudgetBookUseCase;

  StreamSubscription<List<Booking>>? _bookingSub;

  BudgetBookCubit(this._generateBudgetSummaryUseCase, this._filterAndGroupBookingsUseCase, this._manager, this._resetBudgetBookUseCase, this._generateBudgetTransactionUseCase)
    : super(_initialState()) {
    _subscribeToBookings();
  }

  static BudgetBookState _initialState() {
    final filter = BudgetBookFilter.initial();
    final period = filter.period;
    final now = DateTime.now();
    final dateRange = BudgetDateRange(period: period, from: now, to: now);
    return BudgetBookState.initial(filter: filter, dateRange: dateRange);
  }

  void _subscribeToBookings() {
    _bookingSub?.cancel();
    _bookingSub = _manager.watch().listen(_onBookings);
  }

  Future<void> _onBookings(List<Booking> rawBookingList) => safeRun(
    action: () async {
      final filtered = await _filterAndGroupBookingsUseCase.load(rawBookingList, state.filter);
      final items = await _generateViewData(filtered, state.viewMode);

      final now = DateTime.now();
      BudgetDateRange? dateRange;
      for (final p in items) {
        if (!now.isBefore(p.dateRange.from) && !now.isAfter(p.dateRange.to)) {
          dateRange = p.dateRange;
          break;
        }
      }
      dateRange ??= items.isNotEmpty ? items.first.dateRange : state.dateRange;
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "loaded bookings for budget book: $dateRange");

      emit(BudgetBookState.loaded(items: items, filter: state.filter, viewMode: state.viewMode, dateRange: dateRange, isInitial: true));
    },
    onError: (e, appError) => BudgetBookState.fromError(error: appError, state: state),
  );

  Future<List<BudgetViewData>> _generateViewData(List<BudgetPageData> filtered, BudgetViewMode viewMode) async {
    switch (viewMode) {
      case BudgetViewMode.summary:
        return await _generateBudgetSummaryUseCase.generate(filtered);
      case BudgetViewMode.transaction:
        return await _generateBudgetTransactionUseCase(filtered);
      case BudgetViewMode.calendar:
        return await _generateBudgetTransactionUseCase(filtered);
    }
  }

  Future<void> updateView({BudgetBookFilter? filter, BudgetViewMode? viewMode}) => safeRun(
    action: () async {
      final newViewMode = viewMode ?? state.viewMode;
      final newFilter = filter ?? state.filter;
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "update view for budget book: $newViewMode / $newFilter");

      final bookings = await _manager.watch().first;
      final filtered = await _filterAndGroupBookingsUseCase.load(bookings, newFilter);
      final items = await _generateViewData(filtered, newViewMode);

      state.maybeWhen(
        loaded: (_, __, ___, dateRange, ____) => emit(BudgetBookState.loaded(items: items, filter: newFilter, viewMode: newViewMode, dateRange: dateRange, isInitial: false)),
        orElse: () => emit(state.copyWith(items: items, filter: newFilter, viewMode: newViewMode)),
      );
    },
    onError: (e, appError) => BudgetBookState.fromError(error: appError, state: state),
  );

  void setDateRange(BudgetDateRange range) {
    EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "update range for budget book: $range");
    emit(state.copyWith(dateRange: range));
  }

  Future<void> resetAndLoad() => safeRun(
    action: () async {
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "reset and load for budget book: ${state.viewMode} / ${state.filter}");
      emit(BudgetBookState.loading(items: [], filter: state.filter, viewMode: state.viewMode, dateRange: state.dateRange));
      await _resetBudgetBookUseCase.reset();
    },
    onError: (e, appError) => BudgetBookState.fromError(error: appError, state: state),
  );

  @override
  Future<void> close() async {
    await _bookingSub?.cancel();
    return super.close();
  }
}
