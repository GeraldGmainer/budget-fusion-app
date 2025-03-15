import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatelessWidget {
  final List<Map<String, String>> _transactions = [
    {'type': 'Booking', 'description': 'Hotel Booking', 'amount': '-\$120.00'},
    {'type': 'Transfer', 'description': 'Bank Transfer', 'amount': '+\$500.00'},
    {'type': 'Booking', 'description': 'Flight Ticket', 'amount': '-\$350.00'},
    {'type': 'Transfer', 'description': 'Salary', 'amount': '+\$3,000.00'},
    {'type': 'Booking', 'description': 'Concert Ticket', 'amount': '-\$80.00'},
    {'type': 'Transfer', 'description': 'Gift Money', 'amount': '+\$150.00'},
    {'type': 'Booking', 'description': 'E-Book Purchase', 'amount': '-\$15.00'},
    {'type': 'Booking', 'description': 'Hotel Booking', 'amount': '-\$120.00'},
    {'type': 'Transfer', 'description': 'Bank Transfer', 'amount': '+\$500.00'},
    {'type': 'Booking', 'description': 'Flight Ticket', 'amount': '-\$350.00'},
    {'type': 'Transfer', 'description': 'Salary', 'amount': '+\$3,000.00'},
    {'type': 'Booking', 'description': 'Concert Ticket', 'amount': '-\$80.00'},
    {'type': 'Transfer', 'description': 'Gift Money', 'amount': '+\$150.00'},
    {'type': 'Booking', 'description': 'E-Book Purchase', 'amount': '-\$15.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return CardWithAction(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          _buildList(context),
          _buildShowMore(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text('Recent Transactions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
  }

  Widget _buildShowMore(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Show More',
        style: TextStyle(color: AppColors.accentColor, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return TransactionList(
      itemCount: _transactions.length,
      itemBuilder: (BuildContext context, int index) {
        final transaction = _transactions[index];
        return TransactionItem(
          iconData: Icons.book_online,
          iconColor: Colors.blue,
          title: transaction['description']!,
          subtitle: "2024/11/15",
          amount: transaction['amount']!,
        );
      },
    );
  }
}
