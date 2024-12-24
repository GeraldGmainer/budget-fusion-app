import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;

  const TransactionItem({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Icon(
        iconData,
        color: iconColor,
        size: 32,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(subtitle),
      trailing: Text(
        amount,
        style: TextStyle(
          fontSize: 15,
          color: amount.startsWith('+') ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
