import 'package:budget_fusion_app/features/settings/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

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
              BudgetSettingsTile.navigation(
                icon: Icons.account_balance,
                title: 'Accounts',
                route: '',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.category,
                title: 'Categories',
                route: '',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.pie_chart,
                title: 'Budget Plan',
                route: '',
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Data Maintenance'),
            tiles: const [
              BudgetSettingsTile.navigation(
                icon: Icons.backup,
                title: 'Backup & Restore',
                route: '/backupRestore',
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Account Management'),
            tiles: const [
              BudgetSettingsTile.navigation(
                icon: Icons.lock,
                title: 'Privacy & Security',
                route: '/privacySecurity',
              ),
              BudgetSettingsTile.navigation(
                icon: Icons.delete_forever,
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
