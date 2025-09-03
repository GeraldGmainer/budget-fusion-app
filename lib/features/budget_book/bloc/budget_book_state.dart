part of 'budget_book_cubit.dart';

@freezed
abstract class BudgetBookState with _$BudgetBookState {
  factory BudgetBookState.initial({
    @Default([]) List<BudgetViewData> items,
    required BudgetBookFilter filter,
    @Default(BudgetViewMode.summary) BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
  }) = _Initial;

  const factory BudgetBookState.loading({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
  }) = _Loading;

  const factory BudgetBookState.loaded({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
    required bool isInitial,
  }) = _Loaded;

  const factory BudgetBookState.error({
    required List<BudgetViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
    required AppError error,
  }) = _Error;

  static BudgetBookState fromError({required AppError error, required BudgetBookState state}) {
    return BudgetBookState.error(items: state.items, filter: state.filter, viewMode: state.viewMode, dateRange: state.dateRange, error: error);
  }

  @override
  String toString() {
    return when(
      initial: (_, filter, viewMode, dateRange) => 'BookingPageState Initial:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      loading: (_, filter, viewMode, dateRange) => 'BookingPageState Loading:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      loaded: (_, filter, viewMode, dateRange, __) => 'BookingPageState Loaded:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      error: (_, filter, viewMode, dateRange, error) => 'BookingPageState Error:\n- Message: $error\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
    );
  }
}

extension BookingPageStateExtensions on BudgetBookState {
  bool get isLoading => maybeWhen(loading: (_, __, ___, ____) => true, orElse: () => false);

  bool get isLoaded => maybeWhen(loaded: (_, __, ___, ____, _____) => true, orElse: () => false);

  bool get isError => maybeWhen(error: (_, __, ___, ____, _____) => true, orElse: () => false);

  PeriodMode get period => filter.period;
}
