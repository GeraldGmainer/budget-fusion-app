part of 'booking_page_bloc.dart';

@freezed
class BookingPageState with _$BookingPageState {
  const factory BookingPageState.initial({
    required List<BookingPageData> rawItems,
    required List<BookingPageViewData> viewItems,
    required BudgetBookFilter currentFilter,
    required BookingViewMode currentViewMode,
  }) = _Initial;

  const factory BookingPageState.loading({
    required List<BookingPageData> rawItems,
    required List<BookingPageViewData> viewItems,
    required bool isFirstFetch,
    required BudgetBookFilter currentFilter,
    required BookingViewMode currentViewMode,
  }) = _Loading;

  const factory BookingPageState.loaded({
    required List<BookingPageData> rawItems,
    required List<BookingPageViewData> viewItems,
    required bool hasReachedMax,
    required bool isInitial,
    required BudgetBookFilter currentFilter,
    required BookingViewMode currentViewMode,
  }) = _Loaded;

  const factory BookingPageState.error({
    required List<BookingPageData> rawItems,
    required List<BookingPageViewData> viewItems,
    required String message,
    required BudgetBookFilter currentFilter,
    required BookingViewMode currentViewMode,
  }) = _Error;
}

extension BookingPageStateExtensions on BookingPageState {
  List<SummaryViewData> get summaries => viewItems.whereType<SummaryViewData>().toList();

  bool isViewMode(BookingViewMode mode) => currentViewMode == mode;

  bool get isLoading => maybeWhen(
        loading: (_, __, ___, ____, _____) => true,
        orElse: () => false,
      );

  bool get isFirstFetch => maybeWhen(
        loading: (_, __, isFirstFetch, ____, _____) => isFirstFetch,
        orElse: () => false,
      );

  bool get isLoaded => maybeWhen(
        loaded: (_, __, ___, ____, _____, ______) => true,
        orElse: () => false,
      );

  bool get isError => maybeWhen(
        error: (_, __, ___, ____, _____) => true,
        orElse: () => false,
      );

  bool get canLoadMore => maybeWhen(
        loaded: (_, __, hasReachedMax, ____, _____, ______) => !hasReachedMax,
        orElse: () => false,
      );

  bool get isInitial => maybeWhen(
        loaded: (_, __, ___, isInitial, _____, ______) => isInitial,
        orElse: () => false,
      );
}
