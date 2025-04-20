part of 'booking_save_cubit.dart';

@freezed
class BookingSaveState with _$BookingSaveState {
  factory BookingSaveState.initial({
    required BookingDraft draft,
  }) = _Initial;

  factory BookingSaveState.draftUpdate({
    required BookingDraft draft,
  }) = _DraftUpdate;

  const factory BookingSaveState.loading({
    required BookingDraft draft,
  }) = _Loading;

  const factory BookingSaveState.loaded({
    required BookingDraft draft,
  }) = _Loaded;

  const factory BookingSaveState.deleted({
    required BookingDraft draft,
    required Booking booking,
  }) = _Deleted;

  const factory BookingSaveState.error({
    required BookingDraft draft,
    required String message,
  }) = _Error;
}
