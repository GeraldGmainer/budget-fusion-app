import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../repos/booking/booking.dart';
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
  final BookingRepo _repo;
  final FilterAndGroupBookingsUseCase _filterAndGroupBookingsUseCase;
  final GenerateBudgetSummaryUseCase _generateBudgetSummaryUseCase;
  final GenerateBudgetTransactionUseCase _generateBudgetTransactionUseCase;
  final ResetBudgetBookUseCase _resetBudgetBookUseCase;

  StreamSubscription<List<Booking>>? _bookingSub;
  Timer? _loadingTimeout;

  BudgetBookCubit(this._generateBudgetSummaryUseCase, this._filterAndGroupBookingsUseCase, this._repo, this._resetBudgetBookUseCase, this._generateBudgetTransactionUseCase)
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
    _bookingSub = _repo.watch().listen(_onBookings);
  }

  Future<void> _onBookings(List<Booking> rawBookingList) => safeRun(
    action: () async {
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "generate view for ${rawBookingList.length} bookings");
      _clearLoadingTimeout();
      final filtered = await _filterAndGroupBookingsUseCase.load(rawBookingList, state.filter);
      final items = await _generateViewData(filtered, state.viewMode);
      bool isInitial = state.maybeWhen(initial: (_, _, _, _) => true, orElse: () => false);
      BudgetDateRange dateRange = _determineDateRange(isInitial, items);

      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "loaded bookings for budget book: $dateRange");
      emit(BudgetBookState.loaded(items: items, filter: state.filter, viewMode: state.viewMode, dateRange: dateRange, isInitial: true));
    },
    onError: (e, appError) => BudgetBookState.fromError(error: appError, state: state),
  );

  BudgetDateRange _determineDateRange(bool isInitial, List<BudgetViewData> items) {
    if (isInitial) {
      final now = DateTime.now();
      for (final p in items) {
        if (!now.isBefore(p.dateRange.from) && !now.isAfter(p.dateRange.to)) {
          return p.dateRange;
        }
      }
      if (items.isNotEmpty) {
        return items.first.dateRange;
      }
    }
    return state.dateRange;
  }

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

      final bookings = await _repo.watch().first;
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

  Future<void> reload() => safeRun(
    action: () async {
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "reload for budget book: ${state.viewMode} / ${state.filter}");
      emit(BudgetBookState.loading(items: state.items, filter: state.filter, viewMode: state.viewMode, dateRange: state.dateRange));
      _startLoadingTimeout();
      await _resetBudgetBookUseCase.reload();
      EntityLogger.instance.d(runtimeType.toString(), EntityType.booking.name, "reload for budget book done");
    },
    onError: (e, appError) => BudgetBookState.fromError(error: appError, state: state),
  );

  void _startLoadingTimeout() {
    _loadingTimeout?.cancel();
    final snapshot = state;
    _loadingTimeout = Timer(const Duration(seconds: 10), () {
      final stillLoading = state.maybeWhen(loading: (_, __, ___, ____) => true, orElse: () => false);
      if (!stillLoading) return;
      emit(BudgetBookState.loaded(items: snapshot.items, filter: snapshot.filter, viewMode: snapshot.viewMode, dateRange: snapshot.dateRange, isInitial: false));
    });
  }

  void _clearLoadingTimeout() {
    _loadingTimeout?.cancel();
    _loadingTimeout = null;
  }

  @override
  Future<void> close() async {
    _clearLoadingTimeout();
    await _bookingSub?.cancel();
    return super.close();
  }
}
