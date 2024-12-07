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
// better loading indictor
// dont load more when loading more
// refactor BookingPageDataLoader
// refactor BookingPageBloc
// move pagination logic in budget tab or widget ...

@injectable
class BookingPageBloc extends Bloc<BookingPageEvent, BookingPageState> {
  final List<BookingPageData> _currentItems = [];
  final BookingPageDataLoader _bookingPageDataLoader;
  int _nextLoadingPage = 0;

  BookingPageBloc(this._bookingPageDataLoader) : super(const BookingPageState.initial()) {
    on<BookingPageEvent>((event, emit) async {
      await event.when(
        loadInitial: (filter) => _onLoadInitial(emit, filter),
        loadMore: (filter) => _onLoadMore(emit, filter),
        applyFilter: (filter) => _onApplyFilter(emit, filter),
      );
    });
  }

  Future<void> _onLoadInitial(Emitter<BookingPageState> emit, BudgetBookFilter filter) async {
    final stopwatch = Stopwatch()..start();

    try {
      _currentItems.clear();
      state.whenOrNull(initial: () {
        emit(const BookingPageState.loading(items: [], isFirstFetch: true));
      }, loaded: (items, _) {
        emit(BookingPageState.loading(items: items, isFirstFetch: false));
      });

      const currentPage = 0;
      final pageCount = filter.period.initialDuration;
      final newItems = await _bookingPageDataLoader.load(filter.period, currentPage, pageCount);
      _currentItems.clear();
      _currentItems.addAll(newItems);
      final filteredItems = _filterItems(_currentItems, filter);
      await Future.delayed(Duration(seconds: 1));
      _nextLoadingPage = pageCount;
      emit(BookingPageState.loaded(items: filteredItems, isInitial: true));
    } catch (e) {
      BudgetLogger.instance.e(e);
      final List<BookingPageData> currentItems = state.maybeWhen(loaded: (items, _) => items, loading: (items, _) => items, orElse: () => []);
      emit(BookingPageState.error(message: e.toString(), items: currentItems));
    } finally {
      BudgetLogger.instance.d("loading Pagination for ${filter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onLoadMore(Emitter<BookingPageState> emit, BudgetBookFilter filter) async {
    final stopwatch = Stopwatch()..start();
    try {
      state.whenOrNull(
        loaded: (items, _) {
          emit(BookingPageState.loading(items: items, isFirstFetch: false));
        },
        error: (items, msg) {
          emit(BookingPageState.loading(items: items, isFirstFetch: false));
        },
      );

      final currentPage = _nextLoadingPage;
      final pageCount = filter.period.moreDuration;
      final newItems = await _bookingPageDataLoader.load(filter.period, currentPage, pageCount);

      if (newItems.isEmpty) {
        emit(BookingPageState.loaded(items: _filterItems(_currentItems, filter), isInitial: false));
      } else {
        _currentItems.insertAll(0, newItems);
        final filteredItems = _filterItems(_currentItems, filter);
        emit(BookingPageState.loaded(items: filteredItems, isInitial: false));
      }
      _nextLoadingPage = currentPage + pageCount;
    } catch (e) {
      BudgetLogger.instance.e(e);
      final List<BookingPageData> currentItems = state.maybeWhen(
        loaded: (items, _) => items,
        loading: (items, _) => items,
        orElse: () => [],
      );
      emit(BookingPageState.error(message: e.toString(), items: currentItems));
    } finally {
      BudgetLogger.instance.d("loading more data for ${filter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onApplyFilter(Emitter<BookingPageState> emit, BudgetBookFilter filter) async {}

  List<BookingPageData> _filterItems(List<BookingPageData> items, BudgetBookFilter filter) {
    // TODO filter
    return items;
  }
}
