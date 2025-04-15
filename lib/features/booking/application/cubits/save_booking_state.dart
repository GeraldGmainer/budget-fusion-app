part of 'save_booking_cubit.dart';

@freezed
class SaveBookingState with _$SaveBookingState {
  factory SaveBookingState.initial({
    required BookingDraft draft,
  }) = _Initial;

  factory SaveBookingState.draftUpdate({
    required BookingDraft draft,
  }) = _DraftUpdate;

  const factory SaveBookingState.loading({
    required BookingDraft draft,
  }) = _Loading;

  const factory SaveBookingState.loaded({
    required BookingDraft draft,
  }) = _Loaded;

  const factory SaveBookingState.error({
    required BookingDraft draft,
    required String message,
  }) = _Error;
}
