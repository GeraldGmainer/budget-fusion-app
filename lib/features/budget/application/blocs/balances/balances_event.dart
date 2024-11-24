part of 'balances_bloc.dart';

@freezed
class BalancesEvent with _$BalancesEvent {
  const factory BalancesEvent.load(List<BookingPeriod> periods) = _Load;
}
