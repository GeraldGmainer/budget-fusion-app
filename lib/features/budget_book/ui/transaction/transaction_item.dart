import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Booking booking;

  const TransactionItem({super.key, required this.booking});

  _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.bookingSave, arguments: booking);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
      dense: true,
      minVerticalPadding: 0,
      onTap: () => _onTap(context),
      visualDensity: const VisualDensity(vertical: -4),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(context),
      trailing: MoneyText(money: booking.money, color: booking.category.categoryType.color, fontSize: 15),
    );
  }

  Widget _buildIcon() {
    return SizedBox(
      width: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BudgetIcon(name: booking.category.iconName, color: booking.category.iconColor),
          if (!booking.isSynced) Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.errorColor, shape: BoxShape.circle)),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(booking.category.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget? _buildSubtitle(BuildContext context) {
    if (booking.description == null || booking.description!.isEmpty) {
      return null;
    }
    return Text(booking.description!);
  }
}
