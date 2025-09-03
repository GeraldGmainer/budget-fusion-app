part of 'booking_save_cubit.dart';

@freezed
abstract class BookingSaveState with _$BookingSaveState {
  factory BookingSaveState.initial({required BookingDraft draft}) = _Initial;

  factory BookingSaveState.draftUpdate({required BookingDraft draft, required BookingDraft initialDraft}) = _DraftUpdate;

  const factory BookingSaveState.loading({required BookingDraft draft}) = _Loading;

  const factory BookingSaveState.loaded({required BookingDraft draft}) = _Loaded;

  const factory BookingSaveState.deleted({required BookingDraft draft, required Booking booking}) = _Deleted;

  const factory BookingSaveState.error({required BookingDraft draft, required AppError error}) = _Error;
}

extension BookingSaveStateX on BookingSaveState {
  BookingDraft? get initialDraft => whenOrNull(draftUpdate: (_, BookingDraft initialDraft) => initialDraft);
}
