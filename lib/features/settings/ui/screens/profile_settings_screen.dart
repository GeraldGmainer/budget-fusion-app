import 'package:budget_fusion_app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../ui.dart';

class ProfileSettingScreen extends StatelessWidget {
  _onLogout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      darkTheme: getSettingsTheme(),
      brightness: Brightness.dark,
      sections: [
        SettingsSection(
          title: const Text('Profile'),
          tiles: [
            BudgetSettingsTile.navigation(
              icon: Icons.person,
              title: 'Edit Profile',
              route: EditProfilePage.route,
            ),
            BudgetSettingsTile.navigation(
              icon: Icons.group,
              title: 'Manage Workspace',
              route: EditProfilePage.route,
            ),
            BudgetSettingsTile.navigation(
              icon: Icons.settings,
              title: 'Settings',
              route: SettingsPage.route,
            ),
            BudgetSettingsTile.action(
              icon: Icons.logout,
              title: "Logout",
              iconColor: AppColors.errorColor,
              onPressed: (context) {
                _onLogout(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
