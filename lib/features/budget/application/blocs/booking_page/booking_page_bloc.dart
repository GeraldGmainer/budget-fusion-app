import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'booking_page_bloc.freezed.dart';
part 'booking_page_event.dart';
part 'booking_page_state.dart';

// TODO
// missing months when no booking because 3 months are loaded and only last month is displayed in UI
// check backend has more data
// add data for 2023 and check if 2024-01, 2024-02 are also loaded

@injectable
class BookingPageBloc extends Bloc<BookingPageEvent, BookingPageState> {
  final BookingPageDataLoader _bookingPageDataLoader;
  final SummaryAggregator _summaryAggregator;

  BookingPageBloc(this._bookingPageDataLoader, this._summaryAggregator)
      : super(BookingPageState.initial(
          rawItems: [],
          viewItems: [],
          currentFilter: BudgetBookFilter.initial(),
          currentViewMode: BookingViewMode.summary,
        )) {
    on<BookingPageEvent>((event, emit) async {
      await event.when(
        loadInitial: (filter, viewMode) => _onLoadInitial(emit, filter, viewMode),
        loadMore: () => _onLoadMore(emit),
        updateView: (filter, viewMode) => _onUpdateView(emit, filter, viewMode),
      );
    });
  }

  Future<void> _onLoadInitial(Emitter<BookingPageState> emit, BudgetBookFilter filter, BookingViewMode viewMode) async {
    final stopwatch = Stopwatch()..start();

    try {
      emit(BookingPageState.loading(
        rawItems: [],
        viewItems: [],
        isFirstFetch: true,
        currentFilter: filter,
        currentViewMode: viewMode,
      ));

      const currentPage = 0;
      final pageCount = filter.period.initialDuration;
      final loadedItems = await _bookingPageDataLoader.load(filter.period, currentPage, pageCount);
      final filteredItems = _filterItems(loadedItems, filter);
      final viewItems = await _convertItems(filteredItems, viewMode);
      emit(BookingPageState.loaded(
        rawItems: loadedItems,
        viewItems: viewItems,
        isInitial: true,
        hasReachedMax: false,
        currentFilter: filter,
        currentViewMode: viewMode,
      ));
    } catch (e) {
      BudgetLogger.instance.e(e);
      emit(BookingPageState.error(
        message: e.toString(),
        rawItems: state.rawItems,
        viewItems: state.viewItems,
        currentFilter: filter,
        currentViewMode: viewMode,
      ));
    } finally {
      BudgetLogger.instance.d("loading Pagination for ${filter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onLoadMore(Emitter<BookingPageState> emit) async {
    final stopwatch = Stopwatch()..start();
    try {
      emit(BookingPageState.loading(
        rawItems: state.rawItems,
        viewItems: state.viewItems,
        isFirstFetch: false,
        currentFilter: state.currentFilter,
        currentViewMode: state.currentViewMode,
      ));

      final currentPage = _calculateNextPage(state.rawItems.length);
      final pageCount = state.currentFilter.period.moreDuration;
      final newItems = await _bookingPageDataLoader.load(state.currentFilter.period, currentPage, pageCount);
      final loadedItems = List<BookingPageData>.from(state.rawItems)..insertAll(0, newItems);
      final filteredItems = _filterItems(loadedItems, state.currentFilter);
      final viewItems = await _convertItems(filteredItems, state.currentViewMode);
      emit(BookingPageState.loaded(
        rawItems: loadedItems,
        viewItems: viewItems,
        isInitial: false,
        hasReachedMax: false,
        currentFilter: state.currentFilter,
        currentViewMode: state.currentViewMode,
      ));
    } catch (e) {
      BudgetLogger.instance.e(e);
      emit(BookingPageState.error(
        message: e.toString(),
        rawItems: state.rawItems,
        viewItems: state.viewItems,
        currentFilter: state.currentFilter,
        currentViewMode: state.currentViewMode,
      ));
    } finally {
      BudgetLogger.instance.d("loading more data for ${state.currentFilter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onUpdateView(Emitter<BookingPageState> emit, BudgetBookFilter? filter, BookingViewMode? viewMode) async {
    final rawItems = state.rawItems;
    final newFilter = filter ?? state.currentFilter;
    final newViewMode = viewMode ?? state.currentViewMode;
    emit(BookingPageState.loading(
      rawItems: rawItems,
      viewItems: state.viewItems,
      isFirstFetch: false,
      currentFilter: newFilter,
      currentViewMode: newViewMode,
    ));

    final filteredItems = _filterItems(rawItems, newFilter);
    final viewItems = await _convertItems(filteredItems, newViewMode);
    emit(BookingPageState.loaded(
      rawItems: rawItems,
      viewItems: viewItems,
      isInitial: false,
      hasReachedMax: false,
      currentFilter: newFilter,
      currentViewMode: newViewMode,
    ));
  }

  List<BookingPageData> _filterItems(List<BookingPageData> items, BudgetBookFilter filter) {
    // TODO filter
    return items;
  }

  Future<List<BookingPageViewData>> _convertItems(List<BookingPageData> items, BookingViewMode viewMode) async {
    switch (viewMode) {
      case BookingViewMode.summary:
      case BookingViewMode.transaction:
      case BookingViewMode.balance:
      case BookingViewMode.calendar:
        return await _summaryAggregator.convert(items);
    }
  }

  int _calculateNextPage(int currentItemCount) {
    return currentItemCount;
  }
}
