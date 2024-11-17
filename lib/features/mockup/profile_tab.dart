import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../core/constants/app_colors.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              title: Row(
                children: const [
                  Icon(
                    Icons.account_circle,
                    color: AppColors.secondaryTextColor,
                    size: 44,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'John Doe', // Replace with dynamic data
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 3.0,
                              color: Colors.black54,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'johndoe@example.com', // Replace with dynamic data
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: _buildSettings(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return SettingsList(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      darkTheme: _getTheme(context),
      brightness: Brightness.dark,
      sections: [
        SettingsSection(
          title: const Text('Account'),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to profile editing
              },
            ),
            SettingsTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Logout logic
              },
            ),
          ],
        ),
        SettingsSection(
          title: const Text('General'),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.currency_exchange),
              title: const Text('Currency'),
              value: const Text('EUR (€)'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to currency settings
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to language settings
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.account_balance_wallet),
              title: const Text('Accounts'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to accounts settings
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to categories settings
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.pie_chart),
              title: const Text('Budget Plan'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to budget plan settings
              },
            ),
          ],
        ),
        SettingsSection(
          title: const Text('Other'),
          tiles: [
            SettingsTile(
              leading: const Icon(Icons.info),
              title: const Text('App Version'),
              value: const Text('1.0.0'), // Replace dynamically
            ),
          ],
        ),
      ],
    );
  }

  SettingsThemeData _getTheme(BuildContext context) {
    return SettingsThemeData(
      settingsListBackground: AppColors.primaryColor,
      leadingIconsColor: AppColors.accentColor,
      settingsTileTextColor: AppColors.primaryTextColor,
      tileDescriptionTextColor: AppColors.secondaryTextColor,
      titleTextColor: AppColors.primaryTextColor,
    );
  }
}
