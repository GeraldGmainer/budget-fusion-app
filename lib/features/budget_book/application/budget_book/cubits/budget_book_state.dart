part of 'budget_book_cubit.dart';

@freezed
class BudgetBookState with _$BudgetBookState {
  const factory BudgetBookState.initial({
    @Default([]) List<BudgetPageData> rawItems,
    @Default([]) List<SummaryViewData> summaries,
    required BudgetBookFilter currentFilter,
    required BudgetViewMode currentViewMode,
  }) = _Initial;

  const factory BudgetBookState.loading({
    required List<BudgetPageData> rawItems,
    required List<SummaryViewData> summaries,
    required BudgetBookFilter currentFilter,
    required BudgetViewMode currentViewMode,
  }) = _Loading;

  const factory BudgetBookState.loaded({
    required List<BudgetPageData> rawItems,
    required List<SummaryViewData> summaries,
    required BudgetBookFilter currentFilter,
    required BudgetViewMode currentViewMode,
  }) = _Loaded;

  const factory BudgetBookState.error({
    required List<BudgetPageData> rawItems,
    required List<SummaryViewData> summaries,
    required BudgetBookFilter currentFilter,
    required BudgetViewMode currentViewMode,
    required String message,
  }) = _Error;

  static BudgetBookState fromError({
    required String message,
    required BudgetBookState state,
  }) {
    return BudgetBookState.error(
      rawItems: state.rawItems,
      summaries: state.summaries,
      currentFilter: state.currentFilter,
      currentViewMode: state.currentViewMode,
      message: message,
    );
  }

  @override
  String toString() {
    return when(
      initial: (rawItems, summaries, currentFilter, currentViewMode) => 'BookingPageState Initial:\n- Filter: $currentFilter\n- View: $currentViewMode',
      loading: (rawItems, summaries, currentFilter, currentViewMode) => 'BookingPageState Loading:\n- Filter: $currentFilter\n- View: $currentViewMode',
      loaded: (rawItems, summaries, currentFilter, currentViewMode) => 'BookingPageState Loaded:\n- Filter: $currentFilter\n- View: $currentViewMode',
      error: (rawItems, summaries, message, currentFilter, currentViewMode) =>
          'BookingPageState Error:\n- Message: $message\n- Filter: $currentFilter\n- View: $currentViewMode',
    );
  }
}
