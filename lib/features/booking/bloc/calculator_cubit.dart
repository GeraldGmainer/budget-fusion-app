import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:math_expressions/math_expressions.dart';

import '../ui/calculator/calculator_key.dart';

part 'calculator_cubit.freezed.dart';
part 'calculator_state.dart';

@injectable
class CalculatorCubit extends Cubit<CalculatorState> {
  static final operations = [CalculatorKey.addition, CalculatorKey.subtraction, CalculatorKey.multiplication, CalculatorKey.division];
  final Parser _parser = Parser();
  final ContextModel _context = ContextModel();

  CalculatorCubit() : super(const CalculatorState.initial());

  void init(double? initialAmount) {
    if (initialAmount == null) {
      emit(CalculatorState.initial());
    } else {
      final initialString = toTrimmedString(initialAmount);
      final historyTokens = initialString.split('');
      _updateState(initialAmount, history: historyTokens);
    }
  }

  String toTrimmedString(double value) {
    final s = value.toStringAsFixed(3);
    return s.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }

  void clear() {
    _updateState(0, history: []);
  }

  Future<void> back() async {
    if (state.history.isNotEmpty) {
      _calculateResult(state.history.sublist(0, state.history.length - 1));
    }
  }

  Future<void> equal() async {
    if (state.history.isNotEmpty) {
      final value = state.result == state.result.truncate() ? state.result.toStringAsFixed(0) : state.result.toStringAsFixed(2);
      _calculateResult([value]);
    }
  }

  Future<void> key(CalculatorKey key) async {
    List<String> history = [...state.history];
    if (key == CalculatorKey.dot) {
      final parts = history.join().split(RegExp(r'[+\-*/]'));
      if (parts.last.contains('.')) {
        return;
      }
    }

    if (_isLastHistoryAOperation() && key.isOperation) {
      history.removeLast();
    }
    history.add(key.calculateText);

    _calculateResult(history);
  }

  void _updateState(double result, {List<String>? history}) {
    emit(CalculatorState.updated(history: history ?? state.history, result: result));
  }

  void _calculateResult(List<String> history) {
    if (history.isEmpty) {
      _updateState(0);
      return;
    }

    String expression = _formatExpression(history);
    try {
      Expression exp = _parser.parse(expression);
      double result = exp.evaluate(EvaluationType.REAL, _context);
      _updateState(result, history: history);
    } catch (e, stackTrace) {
      if (e is RangeError || e is FormatException) {
        _updateState(state.result, history: history);
      } else {
        BudgetLogger.instance.e("Calculate Result Exception", e, stackTrace: stackTrace);
      }
    }
  }

  bool _isLastHistoryAOperation() {
    if (state.history.isEmpty) {
      return false;
    }
    String lastString = state.history.last;
    return operations.map((key) => key.calculateText).contains(lastString);
  }

  String _formatExpression(List<String> history) {
    final temp = [...history];
    String lastString = temp.last;
    if (operations.map((key) => key.calculateText).contains(lastString)) {
      temp.removeLast();
    }
    return temp.join();
  }
}
