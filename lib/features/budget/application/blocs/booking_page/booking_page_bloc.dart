import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';

part 'booking_page_bloc.freezed.dart';
part 'booking_page_event.dart';
part 'booking_page_state.dart';

@injectable
class BookingPageBloc extends Bloc<BookingPageEvent, BookingPageState> {
  final List<BookingPageData> _currentItems = [];
  final BookingPageDataLoader _bookingPageDataLoader;
  int _currentPage = 0;

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
      _currentPage = 0;
      _currentItems.clear();
      state.whenOrNull(initial: () {
        emit(const BookingPageState.loading(items: [], isFirstFetch: true));
      }, loaded: (items) {
        emit(BookingPageState.loading(items: items, isFirstFetch: false));
      });

      // TODO
      // load initially 2 months
      // load more 3 months
      // load initally 2 months of booking. not 2 requests of 1-month
      // update _currentPage
      // calculate hasReachedMax
      // _bookingPageDataLoader.load with daterange model
      // _convertToMonth in different service

      // TODO 05.12.2024 test if  _onLoadInitial works
      final toPage = filter.period.initialDuration;
      final newItems = await _bookingPageDataLoader.load(filter.period, _currentPage, toPage);
      _currentItems.clear();
      _currentItems.addAll(newItems);
      final filteredItems = _filterItems(_currentItems, filter);
      await Future.delayed(Duration(seconds: 1));
      emit(BookingPageState.loaded(items: filteredItems));
    } catch (e) {
      BudgetLogger.instance.e(e);
      final List<BookingPageData> currentItems = state.maybeWhen(loaded: (items) => items, loading: (items, _) => items, orElse: () => []);
      emit(BookingPageState.error(message: e.toString(), items: currentItems));
    } finally {
      BudgetLogger.instance.d("loading Pagination for ${filter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onLoadMore(Emitter<BookingPageState> emit, BudgetBookFilter filter) async {}

  Future<void> _onApplyFilter(Emitter<BookingPageState> emit, BudgetBookFilter filter) async {}

  List<BookingPageData> _filterItems(List<BookingPageData> items, BudgetBookFilter filter) {
    // TODO filter
    return items;
  }
}
