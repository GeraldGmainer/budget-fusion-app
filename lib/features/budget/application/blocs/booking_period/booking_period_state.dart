part of 'booking_period_bloc.dart';

@freezed
class BookingPeriodState with _$BookingPeriodState {
  const factory BookingPeriodState.initial() = _Initial;

  const factory BookingPeriodState.loading() = _Loading;

  const factory BookingPeriodState.loaded(List<BookingPeriod> periods) = _Loaded;

  const factory BookingPeriodState.error(String message) = _Error;
}
