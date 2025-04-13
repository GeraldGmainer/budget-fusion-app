import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Booking booking;
  final Currency currency;

  const TransactionItem({super.key, required this.booking, required this.currency});

  _onTap(BuildContext context) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      onTap: () => _onTap(context),
      visualDensity: const VisualDensity(vertical: 0),
      leading: SizedBox(width: 40, child: BudgetIcon(name: booking.category!.iconName, color: booking.category!.iconColor)),
      title: Text(booking.category?.name ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      trailing: CurrencyText(value: booking.amount, currency: currency, color: booking.category!.categoryType.color, fontSize: 15),
    );
  }
}
