part of 'budget_book_cubit.dart';

@freezed
class BudgetBookState with _$BudgetBookState {
  factory BudgetBookState.initial({
    @Default([]) List<SummaryViewData> items,
    required BudgetBookFilter filter,
    @Default(BudgetViewMode.summary) BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
  }) = _Initial;

  const factory BudgetBookState.loading({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
  }) = _Loading;

  const factory BudgetBookState.loaded({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
  }) = _Loaded;

  const factory BudgetBookState.error({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required BudgetDateRange dateRange,
    required String message,
  }) = _Error;

  static BudgetBookState fromError({
    required String message,
    required BudgetBookState state,
  }) {
    return BudgetBookState.error(
      items: state.items,
      filter: state.filter,
      viewMode: state.viewMode,
      dateRange: state.dateRange,
      message: message,
    );
  }

  @override
  String toString() {
    return when(
      initial: (_, filter, viewMode, dateRange) => 'BookingPageState Initial:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      loading: (_, filter, viewMode, dateRange) => 'BookingPageState Loading:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      loaded: (_, filter, viewMode, dateRange) => 'BookingPageState Loaded:\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
      error: (_, filter, viewMode, dateRange, message) =>
          'BookingPageState Error:\n- Message: $message\n- Filter: $filter\n- ViewMode: $viewMode\n- DateRange: $dateRange',
    );
  }
}

extension BookingPageStateExtensions on BudgetBookState {
  bool get isLoaded => maybeWhen(
        loaded: (_, __, ___, ____) => true,
        orElse: () => false,
      );

  bool get isError => maybeWhen(
        error: (_, __, ___, ____, _____) => true,
        orElse: () => false,
      );
}
