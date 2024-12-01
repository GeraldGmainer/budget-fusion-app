part of 'booking_page_bloc.dart';

@freezed
class BookingPageEvent with _$BookingPageEvent {
  const factory BookingPageEvent.loadInitial(BudgetBookFilter filter) = _LoadInitial;

  const factory BookingPageEvent.loadMore(BudgetBookFilter filter) = _LoadMore;

  const factory BookingPageEvent.applyFilter(BudgetBookFilter filter) = _ApplyFilter;
}
