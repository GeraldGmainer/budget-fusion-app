part of 'booking_filter_bloc.dart';

@freezed
class BookingFilterState with _$BookingFilterState {
  const factory BookingFilterState({
    @Default(null) Account? selectedAccount,
    @Default(TransactionType.outcome) TransactionType selectedTransaction,
    @Default(PeriodMode.month) PeriodMode selectedPeriod,
  }) = _BookingFilterState;
}
