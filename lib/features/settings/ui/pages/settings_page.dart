import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../../core/constants/constants.dart';
import '../ui.dart';

class SettingsPage extends StatelessWidget {
  static const String route = "SettingsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        darkTheme: getSettingsTheme(),
        sections: [
          SettingsSection(
            title: const Text('General Settings'),
            tiles: [
              BudgetSettingsTile.navigation(
                icon: Icons.account_circle,
                title: 'Profile',
                route: '',
              ),
              BudgetSettingsTile.action(
                icon: Icons.currency_exchange,
                title: 'Currency',
                value: 'Euro',
                onPressed: (context) {},
              ),
              BudgetSettingsTile.action(
                icon: Icons.language,
                title: 'Language',
                value: 'English',
                onPressed: (context) {},
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.notifications,
                title: 'Notification Preferences',
                route: '',
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Budget Book Settings'),
            tiles: [
              BudgetSettingsTile.action(
                icon: Icons.account_balance_wallet,
                title: 'Default Account',
                value: 'All Accounts',
                onPressed: (context) {},
              ),
              BudgetSettingsTile.action(
                icon: Icons.calendar_today,
                title: 'Default Period',
                value: 'Month',
                onPressed: (context) {},
              ),
              BudgetSettingsTile.action(
                icon: Icons.book,
                title: 'Default Budget Book View',
                value: 'Summary',
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Data & Security'),
            tiles: const [
              BudgetSettingsTile.navigation(
                icon: Icons.pin,
                title: 'App Pin or Fingerprint',
                route: '',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.backup,
                title: 'Backup & Restore',
                route: '/backupRestore',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.logout,
                iconColor: AppColors.outcomeColor,
                title: 'Logout',
                route: '/deleteAccount',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.delete_forever,
                iconColor: AppColors.outcomeColor,
                title: 'Delete Account',
                route: '/deleteAccount',
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Support & Info'),
            tiles: [
              BudgetSettingsTile.navigation(
                icon: Icons.help,
                title: 'Help & Feedback',
                route: '',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.lock,
                title: 'Privacy & Security',
                route: '/privacySecurity',
              ),
              BudgetSettingsTile.action(
                icon: Icons.info,
                title: 'App Version',
                value: '1.0.0',
                onPressed: (context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
