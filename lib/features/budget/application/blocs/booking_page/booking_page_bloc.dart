import 'package:budget_fusion_app/core/core.dart';
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
  final CacheManager _cacheManager;
  final BookingPageDataLoader _bookingPageDataLoader;

  BookingPageBloc(this._cacheManager, this._bookingPageDataLoader) : super(const BookingPageState.initial()) {
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
      state.whenOrNull(initial: () {
        _currentItems.clear();
        emit(const BookingPageState.loading(items: [], isFirstFetch: true));
      }, loaded: (items) {
        emit(BookingPageState.loading(items: items, isFirstFetch: false));
      });
      _cacheManager.invalidateCache(CacheKey.bookings);

      final newItems = await _bookingPageDataLoader.loadPage(filter.period);
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
