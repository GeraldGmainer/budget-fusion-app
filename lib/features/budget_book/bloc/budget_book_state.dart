part of 'budget_book_cubit.dart';

@freezed
class BudgetBookState with _$BudgetBookState {
  factory BudgetBookState.initial({
    @Default([]) List<BudgetViewData> items,
    required BudgetBookFilter filter,
    @Default(BudgetViewMode.summary) BudgetViewMode viewMode,
    required PeriodMode period,
    @Default(0) int pageIndex,
  }) = _Initial;

  const factory BudgetBookState.loading({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
    @Default(0) int pageIndex,
  }) = _Loading;

  const factory BudgetBookState.loaded({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
    @Default(0) int pageIndex,
  }) = _Loaded;

  const factory BudgetBookState.error({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
    @Default(0) int pageIndex,
    required AppError error,
  }) = _Error;

  static BudgetBookState fromError({required AppError error, required BudgetBookState state}) {
    return BudgetBookState.error(items: state.items, filter: state.filter, viewMode: state.viewMode, period: state.period, error: error);
  }

  @override
  String toString() {
    return when(
      initial: (_, filter, viewMode, period, __) => 'BookingPageState Initial:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      loading: (_, filter, viewMode, period, __) => 'BookingPageState Loading:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      loaded: (_, filter, viewMode, period, __) => 'BookingPageState Loaded:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      error: (_, filter, viewMode, period, __, error) => 'BookingPageState Error:\n- Message: $error\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
    );
  }
}

extension BookingPageStateExtensions on BudgetBookState {
  bool get isLoading => maybeWhen(loading: (_, __, ___, ____, _____) => true, orElse: () => false);

  bool get isLoaded => maybeWhen(loaded: (_, __, ___, ____, _____) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_, __, ___, ____, _____, ______) => true, orElse: () => false);
}
