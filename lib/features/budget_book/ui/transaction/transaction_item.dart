import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Booking booking;
  final Currency currency;

  const TransactionItem({super.key, required this.booking, required this.currency});

  _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.bookingSave, arguments: booking);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      minVerticalPadding: 0,
      onTap: () => _onTap(context),
      visualDensity: const VisualDensity(vertical: -4),
      leading: SizedBox(
        width: 40,
        child: BudgetIcon(name: booking.category!.iconName, color: booking.category!.iconColor),
      ),
      title: Text(booking.category?.name ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: _buildSubtitle(context),
      trailing: CurrencyText(value: booking.amount, currency: currency, color: booking.category!.categoryType.color, fontSize: 15),
    );
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (booking.description == null || booking.description!.isEmpty) {
      return null;
    }
    return Text(booking.description!);
  }
}
