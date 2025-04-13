import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Booking booking;

  const TransactionItem({super.key, required this.booking});

  _onTap(BuildContext context) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            booking.category != null ? Icon(Icons.category, color: Colors.blue) : const Icon(Icons.help_outline),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.category?.name ?? 'Uncategorized',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    booking.description ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Text(
              booking.amount.toString(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
