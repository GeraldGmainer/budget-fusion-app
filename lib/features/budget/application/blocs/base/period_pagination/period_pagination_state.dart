part of 'period_pagination_bloc.dart';

@freezed
class PeriodPaginationState<T> with _$PeriodPaginationState<T> {
  const factory PeriodPaginationState.initial() = _Initial<T>;

  const factory PeriodPaginationState.loading({
    required List<T> items,
    required bool isFirstFetch,
  }) = _Loading<T>;

  const factory PeriodPaginationState.loaded({
    required List<T> items,
    required bool hasReachedMax,
  }) = _Loaded<T>;

  const factory PeriodPaginationState.empty() = _Empty;

  const factory PeriodPaginationState.error({
    required String message,
    required List<T> items,
  }) = _Error<T>;
}
