part of 'booking_view_bloc.dart';

@freezed
class BookingViewEvent with _$BookingViewEvent {
  const factory BookingViewEvent.load(ViewMode mode, List<BookingPeriod> periods) = _Load;
}
