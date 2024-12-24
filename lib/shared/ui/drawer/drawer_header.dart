import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class AppDrawerHeader extends StatelessWidget {
  final String userName;

  const AppDrawerHeader({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: AppColors.linearGradient1,
      ),
      accountName: Text(userName),
      accountEmail: null,
      currentAccountPicture: CircleAvatar(
        child: Text(
          userName.isNotEmpty ? userName[0] : 'U',
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
