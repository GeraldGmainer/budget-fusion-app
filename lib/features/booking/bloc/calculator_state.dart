part of 'calculator_cubit.dart';

@freezed
abstract class CalculatorState with _$CalculatorState {
  const factory CalculatorState.initial({@Default([]) List<String> history, @Default(0) double result}) = _Initial;

  const factory CalculatorState.updated({required List<String> history, required double result}) = _Updated;
}
