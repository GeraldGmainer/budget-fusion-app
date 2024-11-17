import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class RecentTransactions extends StatefulWidget {
  @override
  _RecentTransactionsState createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
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

  bool _showAll = false;

  void _toggleShowMore() {
    setState(() {
      _showAll = !_showAll;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionsToShow = _showAll ? _transactions : _transactions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: _toggleShowMore,
                child: Text(
                  _showAll ? 'Show Less' : 'Show More',
                  style: TextStyle(color: AppColors.accentColor, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: transactionsToShow.length,
          itemBuilder: (context, index) {
            final transaction = transactionsToShow[index];
            return ListTile(
              dense: true,
              leading: Icon(
                transaction['type'] == 'Booking' ? Icons.book_online : Icons.sync_alt,
                color: transaction['type'] == 'Booking' ? Colors.purple : Colors.blue,
                size: 32,
              ),
              title: Text(transaction['description']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Text("2024/11/15"),
              trailing: Text(
                transaction['amount']!,
                style: TextStyle(
                  fontSize: 15,
                  color: transaction['amount']!.startsWith('+') ? Colors.green : Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[800],
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
        ),
      ],
    );
  }
}
