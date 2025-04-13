import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/transaction_group.dart';
import '../../domain/entities/transaction_view_data.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final TransactionViewData data;

  const TransactionList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final group = data.transactionGroups[index];
            return _buildDay(group);
          },
          itemCount: data.transactionGroups.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Divider(
            color: AppColors.disabledTextColor,
            thickness: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildDay(TransactionGroup group) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            DateFormat.yMMMMd().format(group.date),
            style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor),
          ),
        ),
        ...group.bookings.map((booking) => TransactionItem(booking: booking, currency: data.currency))
      ],
    );
  }
}
