import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

typedef BudgetSettingsTileCallback = void Function(BuildContext context);

class BudgetSettingsTile extends AbstractSettingsTile {
  final IconData icon;
  final String title;
  final String? route;
  final BudgetSettingsTileCallback? onPressed;
  final String? value;
  final ValueChanged<bool>? onToggleChanged;
  final Color? iconColor;

  const BudgetSettingsTile.navigation({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
    this.iconColor,
  })  : onPressed = null,
        value = null,
        onToggleChanged = null;

  const BudgetSettingsTile.action({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
    this.value,
    this.onToggleChanged,
    this.iconColor,
  }) : route = null;

  @override
  Widget build(BuildContext context) {
    Widget? trailingWidget;

    if (route != null) {
      trailingWidget = const Icon(Icons.chevron_right, color: AppColors.accentColor);
    } else if (value != null && value!.isNotEmpty) {
      trailingWidget = Text(
        value!,
        style: TextStyle(
          color: AppColors.secondaryTextColor,
          fontSize: 16,
        ),
      );
    }

    VoidCallback? tapCallback;

    if (route != null) {
      tapCallback = () {
        Navigator.pushNamed(context, route!);
      };
    } else if (onPressed != null) {
      tapCallback = () => onPressed!(context);
    }

    return SettingsTile(
      leading: Icon(
        icon,
        color: iconColor ?? AppColors.accentColor,
      ),
      title: Text(title),
      trailing: trailingWidget,
      onPressed: (ctx) {
        tapCallback?.call();
      },
    );
  }
}
