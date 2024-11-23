import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('General Settings'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.currency_exchange),
                title: const Text('Currency'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.notifications),
                title: const Text('Notification Preferences'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.lock),
                title: const Text('Privacy & Security'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.backup),
                title: const Text('Backup & Restore'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.delete),
                title: const Text('Clear Cache'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.delete_forever),
                title: const Text('Delete Account'),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Budget Book Settings'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.view_list),
                title: const Text('Default Budget Book View'),
                value: const Text('Summary'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.account_balance_wallet),
                title: const Text('Default Account'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Default Period'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.account_balance),
                title: const Text('Accounts'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.category),
                title: const Text('Categories'),
                onPressed: (context) {},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.pie_chart),
                title: const Text('Budget Plan'),
                onPressed: (context) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Support & Info'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.help),
                title: const Text('Help & Feedback'),
                onPressed: (context) {},
              ),
              SettingsTile(
                leading: const Icon(Icons.info),
                title: const Text('App Version'),
                value: const Text('1.0.0'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
