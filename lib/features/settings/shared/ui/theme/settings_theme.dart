import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:settings_ui/settings_ui.dart';

SettingsThemeData getSettingsTheme() {
  return SettingsThemeData(
    settingsListBackground: AppColors.primaryColor,
    leadingIconsColor: AppColors.accentColor,
    settingsTileTextColor: AppColors.primaryTextColor,
    tileDescriptionTextColor: AppColors.secondaryTextColor,
    titleTextColor: AppColors.primaryTextColor,
  );
}
