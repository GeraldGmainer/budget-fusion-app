import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/transaction_group.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionGroup> summaries;

  const TransactionList({super.key, required this.summaries});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: summaries.map((group) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  DateFormat.yMMMMd().format(group.date),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const Divider(),
              ...group.bookings.map((booking) => TransactionItem(booking: booking)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
