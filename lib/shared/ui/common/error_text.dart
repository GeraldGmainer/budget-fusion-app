import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final AppError error;
  final VoidCallback? onReload;

  const ErrorText({required this.error, this.onReload});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
          child: Text(error.translationKey.tr(), style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ),
        _buildReload(context),
      ],
    );
  }

  Widget _buildReload(BuildContext context) {
    if (onReload == null) {
      return const SizedBox.shrink();
    }
    return ElevatedButton(onPressed: onReload!, child: const Text("Retry", style: TextStyle(color: AppColors.primaryTextColor)));
  }
}
