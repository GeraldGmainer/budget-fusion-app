part of 'booking_period_bloc.dart';

@freezed
class BookingPeriodEvent with _$BookingPeriodEvent {
  const factory BookingPeriodEvent.load(PeriodMode mode) = _Load;
}
