part of 'booking_filter_bloc.dart';

@freezed
class BookingFilterEvent with _$BookingFilterEvent {
  const factory BookingFilterEvent.setAccount(Account? account) = _SetAccount;

  const factory BookingFilterEvent.setTransaction(TransactionType transaction) = _SetTransaction;

  const factory BookingFilterEvent.setPeriod(PeriodMode period) = _SetPeriod;

  const factory BookingFilterEvent.resetFilters() = _ResetFilters;
}
