import 'package:flutter/material.dart';

import '../../domain/entities/transaction_view_data.dart';
import 'transaction_list.dart';

class TransactionView extends StatelessWidget {
  final TransactionViewData data;

  const TransactionView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.transactionGroups.isNotEmpty)
              RepaintBoundary(
                child: TransactionList(data: data),
              ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
