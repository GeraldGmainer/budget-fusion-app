import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/ui/common/custom_card_with_action.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../repos/booking/booking.dart';
import '../../view_models/transaction_group.dart';
import '../../view_models/transaction_view_data.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final TransactionViewData data;

  const TransactionList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomCardWithAction(
      floatingOption: true,
      child: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => _buildDay(data.transactionGroups[index]),
      padding: EdgeInsets.zero,
      itemCount: data.transactionGroups.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: AppColors.disabledTextColor, thickness: 1),
    );
  }

  Widget _buildDay(TransactionGroup group) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(DateFormat.yMMMMd().format(group.date), style: TextStyle(fontSize: 14, color: AppColors.secondaryTextColor)),
        ),
        ...group.bookings.map((Booking booking) => TransactionItem(booking: booking)),
      ],
    );
  }
}
