part of 'period_pagination_bloc.dart';

@freezed
class PeriodPaginationEvent<T> with _$PeriodPaginationEvent<T> {
  const factory PeriodPaginationEvent.load(BudgetBookFilter filter) = _Load<T>;

  const factory PeriodPaginationEvent.applyFilter(BudgetBookFilter filter) = _ApplyFilter<T>;

  const factory PeriodPaginationEvent.refresh(BudgetBookFilter filter) = _Refresh<T>;
}
