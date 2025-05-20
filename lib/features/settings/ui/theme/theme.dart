import 'package:settings_ui/settings_ui.dart';

import '../../../../core/core.dart';

SettingsThemeData getSettingsTheme() {
  return SettingsThemeData(
    settingsListBackground: AppColors.primaryColor,
    leadingIconsColor: AppColors.accentColor,
    settingsTileTextColor: AppColors.primaryTextColor,
    tileDescriptionTextColor: AppColors.secondaryTextColor,
    titleTextColor: AppColors.primaryTextColor,
  );
}
