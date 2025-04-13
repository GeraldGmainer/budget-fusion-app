import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import 'calculator_key.dart';

class CalculatorButton extends StatelessWidget {
  final CalculatorKey calculatorKey;
  final Function(CalculatorKey) onPressed;
  final Widget? icon;
  final Color backgroundColor;
  final Color fontColor;

  const CalculatorButton({
    required this.calculatorKey,
    required this.onPressed,
    this.icon,
    this.backgroundColor = AppColors.secondaryColor,
    this.fontColor = AppColors.primaryTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Haptics.vibrate(HapticsType.selection);
        onPressed.call(calculatorKey);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: backgroundColor,
      ),
      child: _buildKey(),
    );
  }

  Widget _buildKey() {
    return OverflowBox(
      alignment: Alignment.center,
      maxWidth: double.infinity,
      child: icon ??
          Text(
            calculatorKey.displayText,
            maxLines: 1,
            textAlign: TextAlign.left,
            softWrap: false,
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: fontColor),
          ),
    );
  }
}
