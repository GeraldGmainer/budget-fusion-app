import 'dart:async';

import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import '../../../../data_managers/profile/profile.dart';
import '../../bloc/calculator_cubit.dart';

class AmountDisplay extends StatefulWidget {
  final bool isCalculatorOpen;

  const AmountDisplay({super.key, required this.isCalculatorOpen});

  @override
  State<AmountDisplay> createState() => AmountDisplayState();
}

class AmountDisplayState extends State<AmountDisplay> with SingleTickerProviderStateMixin {
  bool _shake = false;
  Color _backgroundColor = const Color(0x885F6971);
  bool _showCursor = false;
  Timer? _cursorTimer;

  @override
  void didUpdateWidget(covariant AmountDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isCalculatorOpen && _cursorTimer == null) {
      _cursorTimer = Timer.periodic(Duration(milliseconds: 500), (_) {
        setState(() {
          _showCursor = !_showCursor;
        });
      });
    } else if (!widget.isCalculatorOpen) {
      _cursorTimer?.cancel();
      _cursorTimer = null;
      setState(() {
        _showCursor = false;
      });
    }
  }

  @override
  void dispose() {
    _cursorTimer?.cancel();
    super.dispose();
  }

  void triggerShakeAnimation() async {
    setState(() {
      _shake = true;
      _backgroundColor = AppColors.validationErrorColor;
    });
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _shake = false;
      _backgroundColor = const Color(0x885F6971);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: _backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAlias,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        width: double.infinity,
        child: ShakeWidget(duration: Duration(milliseconds: 3000), shakeConstant: ShakeHorizontalConstant2(), autoPlay: _shake, enableWebMouseHover: true, child: _buildView()),
      ),
    );
  }

  Widget _buildView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCurrency(context),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [_buildHistory(state.history), _buildResult(state.result)]),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCurrency(BuildContext context) {
    return BlocBuilder<DataManagerCubit<Profile>, LoadableState<List<Profile>>>(
      builder: (context, state) {
        final value = state.whenOrNull(loaded: (data) => data.first.setting.currency.symbol);
        return Text(value ?? "", style: TextStyle(fontSize: 24, color: AppColors.primaryTextColor));
      },
    );
  }

  Widget _buildHistory(List<String> history) {
    return Padding(padding: const EdgeInsets.only(right: 4), child: Text(history.join(), style: const TextStyle(fontSize: 18, color: AppColors.primaryTextColor)));
  }

  Widget _buildResult(double result) {
    String resultFormatted = result == result.truncate() ? result.toStringAsFixed(0) : result.toStringAsFixed(2);
    return Row(
      children: [
        Text(resultFormatted, style: const TextStyle(fontSize: 38, color: AppColors.primaryTextColor)),
        Container(width: 2, height: 38, color: _showCursor ? AppColors.primaryTextColor : Colors.transparent),
      ],
    );
  }
}
