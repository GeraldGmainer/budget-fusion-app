import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class DisabledField extends StatelessWidget {
  final String label;
  final String value;

  const DisabledField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 12),
      ),
      child: Text(value, style: TextStyle(color: AppColors.disabledTextColor)),
    );
  }
}
