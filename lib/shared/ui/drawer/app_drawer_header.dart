import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../repos/profile/profile.dart';

class AppDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepoSingleNullable<Profile>(
      builder: (context, data) {
        if (data == null) {
          return _buildHeader("Unknown", null);
        }
        return _buildHeader(_buildUserName(data), data.email);
      },
    );
  }

  String _buildUserName(Profile p) {
    final parts = [p.firstName?.trim(), p.lastName?.trim()].whereType<String>().where((s) => s.isNotEmpty).toList();
    return parts.isEmpty ? 'Unknown' : parts.join(' ');
  }

  Widget _buildHeader(String userName, String? email) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: AppColors.linearGradient1),
      accountName: Text(userName),
      accountEmail: email != null ? Text(email, style: TextStyle(color: AppColors.secondaryTextColor, fontSize: 12)) : null,
      currentAccountPicture: CircleAvatar(
        child: Text(
          userName.isNotEmpty ? userName[0] : 'U',
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
