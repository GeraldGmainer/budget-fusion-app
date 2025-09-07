import 'package:flutter/material.dart';

class AppDrawerSection extends StatelessWidget {
  final String name;

  const AppDrawerSection({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
      ),
    );
  }
}
