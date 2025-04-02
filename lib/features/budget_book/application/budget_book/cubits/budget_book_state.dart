part of 'budget_book_cubit.dart';

@freezed
class BudgetBookState with _$BudgetBookState {
  factory BudgetBookState.initial({
    @Default([]) List<SummaryViewData> items,
    required BudgetBookFilter filter,
    @Default(BudgetViewMode.summary) BudgetViewMode viewMode,
    required PeriodMode period,
  }) = _Initial;

  const factory BudgetBookState.loading({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
  }) = _Loading;

  const factory BudgetBookState.loaded({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
  }) = _Loaded;

  const factory BudgetBookState.error({
    required List<SummaryViewData> items,
    required BudgetBookFilter filter,
    required BudgetViewMode viewMode,
    required PeriodMode period,
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
      period: state.period,
      message: message,
    );
  }

  @override
  String toString() {
    return when(
      initial: (_, filter, viewMode, period) => 'BookingPageState Initial:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      loading: (_, filter, viewMode, period) => 'BookingPageState Loading:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      loaded: (_, filter, viewMode, period) => 'BookingPageState Loaded:\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
      error: (_, filter, viewMode, period, message) =>
          'BookingPageState Error:\n- Message: $message\n- Filter: $filter\n- ViewMode: $viewMode\n- Period: $period',
    );
  }
}

extension BookingPageStateExtensions on BudgetBookState {
  bool get isLoading => maybeWhen(
        loading: (_, __, ___, ____) => true,
        orElse: () => false,
      );

  bool get isLoaded => maybeWhen(
        loaded: (_, __, ___, ____) => true,
        orElse: () => false,
      );

  bool get isError => maybeWhen(
        error: (_, __, ___, ____, _____) => true,
        orElse: () => false,
      );
}
