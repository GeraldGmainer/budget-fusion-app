part of 'balances_bloc.dart';

@freezed
class BalancesState with _$BalancesState {
  const factory BalancesState.initial() = _Initial;

  const factory BalancesState.loading() = _Loading;

  const factory BalancesState.loaded() = _Loaded;

  const factory BalancesState.empty() = _Empty;

  const factory BalancesState.error(String message) = _Error;
}
