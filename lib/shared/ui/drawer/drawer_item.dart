import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AppDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? route;
  final bool isSelected;

  const AppDrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.route,
  });

  void _onTap(BuildContext context) {
    Scaffold.of(context).closeDrawer();
    if (route != null) {
      final currentRoute = ModalRoute.of(context)?.settings.name;
      if (currentRoute != route) {
        Navigator.of(context).pushNamed(route!);
      }
    } else {
      showSnackBar(context, "Feature not implemented yet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? AppColors.accentColor : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.accentColor : null,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () => _onTap(context),
    );
  }
}
