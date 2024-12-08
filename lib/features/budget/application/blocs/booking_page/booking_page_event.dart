part of 'booking_page_bloc.dart';

@freezed
class BookingPageEvent with _$BookingPageEvent {
  const factory BookingPageEvent.loadInitial(BudgetBookFilter filter, BookingViewMode viewMode) = _LoadInitial;

  const factory BookingPageEvent.loadMore() = _LoadMore;

  const factory BookingPageEvent.updateView({BudgetBookFilter? filter, BookingViewMode? viewMode}) = _UpdateView;
}
