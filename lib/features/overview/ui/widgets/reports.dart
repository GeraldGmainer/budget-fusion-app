import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.pending_actions, color: AppColors.accentColor),
            title: const Text('Monthly Report', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Review your spending for this month to stay on track.'),
            trailing: IconButton(icon: const Icon(Icons.arrow_forward, color: AppColors.accentColor), onPressed: () {}),
          ),
        ),
      ),
    );
  }
}
