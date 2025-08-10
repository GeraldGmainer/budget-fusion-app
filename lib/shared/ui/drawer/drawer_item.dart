import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? route;
  final bool isSelected;
  final Color? color;
  final String? url;

  const AppDrawerItem({super.key, required this.icon, required this.title, required this.isSelected, required this.route, this.color, this.url});

  void _onTap(BuildContext context) {
    Scaffold.of(context).closeDrawer();
    if (url != null) {
      launchUrl(Uri.parse(url!), mode: LaunchMode.externalApplication);
      return;
    }
    print(route);
    if (route != null) {
      final currentRoute = ModalRoute.of(context)?.settings.name;
      if (currentRoute != route) {
        Navigator.of(context).pushNamed(route!);
      }
    } else {
      context.showComingSoon();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? Theme.of(context).colorScheme.secondary : (color ?? Colors.white70)),
      title: Text(title, style: TextStyle(color: isSelected ? AppColors.accentColor : null, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      selected: isSelected,
      onTap: () => _onTap(context),
    );
  }
}
