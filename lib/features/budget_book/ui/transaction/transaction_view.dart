import 'package:budget_fusion_app/core/constants/app_dimensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../view_models/transaction_view_data.dart';
import '../widgets/budget_book_reloader.dart';
import 'transaction_list.dart';

class TransactionView extends StatelessWidget {
  final TransactionViewData data;

  const TransactionView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BudgetBookReloader(
      child: SingleChildScrollView(
        child: Padding(
          padding: AppDimensions.pageCardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (data.transactionGroups.isNotEmpty) RepaintBoundary(child: TransactionList(data: data)),
              if (data.transactionGroups.isEmpty) _buildEmpty(),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Card(child: Padding(padding: const EdgeInsets.all(16.0), child: SizedBox(width: double.infinity, child: Text("budgetBook.tabs.transaction.empty".tr()))));
  }
}
