import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../core/constants/app_colors.dart';
import 'settings_page.dart';

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
          title: const Text('Profile'),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to profile editing
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.group),
              title: const Text('Manage Workspace'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                // Navigate to profile editing
              },
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            SettingsTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
              onPressed: (context) {},
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
