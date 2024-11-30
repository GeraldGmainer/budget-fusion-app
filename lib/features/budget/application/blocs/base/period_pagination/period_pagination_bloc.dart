import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/domain.dart';

part 'period_pagination_bloc.freezed.dart';
part 'period_pagination_event.dart';
part 'period_pagination_state.dart';

abstract class PeriodPaginationBloc<T> extends Bloc<PeriodPaginationEvent<T>, PeriodPaginationState<T>> {
  int _currentPage = 0;
  bool _hasReachedMax = false;
  final List<BookingPeriod> _currentItems = [];
  final CacheManager _cacheManager = getIt<CacheManager>();

  PeriodPaginationBloc() : super(const PeriodPaginationState.initial()) {
    on<PeriodPaginationEvent<T>>((event, emit) async {
      await event.when(
        load: (filter) => _onLoad(emit, filter),
        applyFilter: (filter) => _onApplyFilter(emit, filter),
        refresh: (filter) => _onRefresh(emit, filter),
      );
    });
  }

  Future<List<BookingPeriod>> fetchItems(PeriodMode period, int page);

  Future<List<T>> convertItems(List<BookingPeriod> items);

  Future<void> _onLoad(Emitter<PeriodPaginationState<T>> emit, BudgetBookFilter filter) async {
    if (_hasReachedMax) return;
    final stopwatch = Stopwatch()..start();

    try {
      print("1");
      state.whenOrNull(initial: () {
        _currentItems.clear();
        emit(const PeriodPaginationState.loading(items: [], isFirstFetch: true));
      }, loading: (items, _) {
        emit(PeriodPaginationState.loading(items: items, isFirstFetch: false));
      });
      print("2");

      final newItems = await fetchItems(filter.period, _currentPage);
      print("3");
      _currentItems.addAll(newItems);
      print("4");
      final filteredItems = _filterItems(_currentItems, filter);
      print("5");
      final convertedItems = await convertItems(filteredItems);
      print("6");
      emit(PeriodPaginationState.loaded(items: convertedItems, hasReachedMax: _hasReachedMax));
    } catch (e) {
      final currentItems = state.maybeWhen(loaded: (items, _) => items, loading: (items, _) => items, orElse: () => <T>[]);
      emit(PeriodPaginationState.error(message: e.toString(), items: currentItems));
    } finally {
      BudgetLogger.instance.d("loading Pagination for ${filter.period} took ${stopwatch.elapsed.inMilliseconds} ms");
    }
  }

  Future<void> _onApplyFilter(Emitter<PeriodPaginationState<T>> emit, BudgetBookFilter filter) async {
    try {
      final filteredItems = _filterItems(_currentItems, filter);
      final convertedItems = await convertItems(filteredItems);
      emit(PeriodPaginationState.loaded(items: convertedItems, hasReachedMax: _hasReachedMax));
    } catch (e) {
      final currentItems = state.maybeWhen(loaded: (items, _) => items, loading: (items, _) => items, orElse: () => <T>[]);
      emit(PeriodPaginationState.error(message: e.toString(), items: currentItems));
    }
  }

  Future<void> _onRefresh(Emitter<PeriodPaginationState<T>> emit, BudgetBookFilter filter) async {
    _currentPage = 0;
    _hasReachedMax = false;
    _cacheManager.invalidateCache(CacheKey.bookings);
    emit(PeriodPaginationState.initial());
    await _onLoad(emit, filter);
  }

  List<BookingPeriod> _filterItems(List<BookingPeriod> items, BudgetBookFilter filter) {
    // TODO filter
    return items;
  }
}
