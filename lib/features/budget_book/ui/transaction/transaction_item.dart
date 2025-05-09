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
    // return ListTile(
    //   contentPadding: EdgeInsets.zero,
    //   dense: true,
    //   minVerticalPadding: 0,
    //   onTap: () => _onTap(context),
    //   visualDensity: const VisualDensity(vertical: 0),
    //   leading: SizedBox(
    //     width: 40,
    //     child: BudgetIcon(name: booking.category!.iconName, color: booking.category!.iconColor),
    //   ),
    //   title: Text(booking.category?.name ?? "", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    //   subtitle: _buildSubtitle(context),
    //   trailing: CurrencyText(value: booking.amount, currency: currency, color: booking.category!.categoryType.color, fontSize: 15),
    // );
    return InkWell(
      onTap: () => _onTap(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: BudgetIcon(name: booking.category!.iconName, color: booking.category!.iconColor),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(booking.category?.name ?? "", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryTextColor)),
                  if (booking.description?.isNotEmpty == true)
                    Text(booking.description!, style: TextStyle(fontSize: 12.0, color: AppColors.secondaryTextColor)),
                ],
              ),
            ),
            CurrencyText(value: booking.amount, currency: currency, color: booking.category!.categoryType.color, fontSize: 15),
          ],
        ),
      ),
    );
  }
}
