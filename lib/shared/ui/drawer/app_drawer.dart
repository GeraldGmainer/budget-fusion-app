import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer_header.dart';
import 'drawer_item.dart';
import 'drawer_section.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  final List<DrawerSection> _sections = const [
    DrawerSection(
      header: 'Main',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.home_variant, title: 'Home', route: '/main'),
        DrawerItem(icon: CommunityMaterialIcons.chart_line, title: 'Investments', route: '/investments'),
        DrawerItem(icon: CommunityMaterialIcons.chart_bar, title: 'Predictions', route: '/predictions'),
        DrawerItem(icon: CommunityMaterialIcons.shopping, title: 'Shopping List', route: '/shopping-list'),
      ],
    ),
    DrawerSection(
      header: 'Financial Management',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.bank, title: 'Accounts', route: '/account'),
        DrawerItem(icon: CommunityMaterialIcons.table_large, title: 'Categories', route: '/categories'),
        DrawerItem(icon: CommunityMaterialIcons.repeat, title: 'Recurring Transactions', route: '/recurring-transactions'),
        DrawerItem(icon: CommunityMaterialIcons.flag_variant, title: 'Budget Goals', route: '/budget_book-goals'),
        DrawerItem(icon: CommunityMaterialIcons.death_star, title: 'Debts', route: '/debts'),
      ],
    ),
    DrawerSection(
      header: 'Collaboration',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.account_group, title: 'Workspace', route: '/workspace'),
      ],
    ),
    DrawerSection(
      header: 'Other',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.crown, title: 'Get Pro', route: '/get-pro'),
        DrawerItem(icon: CommunityMaterialIcons.web, title: 'Open Webpage', route: '/open-webpage'),
        DrawerItem(icon: CommunityMaterialIcons.cog_outline, title: 'Settings', route: '/settings'),
        DrawerItem(icon: CommunityMaterialIcons.help_circle, title: 'Support', route: '/support'),
      ],
    ),
  ];

  void _onTap(BuildContext context, String route) {
    final currentRoute = _getCurrentRoute(context);
    Navigator.pop(context);
    if (currentRoute != route) {
      context.push(route);
    }
  }

  String _getCurrentRoute(BuildContext context) {
    return GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const AppDrawerHeader(userName: 'John Doe'),
          Expanded(child: _buildList(context)),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final currentRoute = _getCurrentRoute(context);

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _sections.length,
      itemBuilder: (context, sectionIndex) {
        final section = _sections[sectionIndex];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDrawerSection(name: section.header),
            ...section.items.map((item) {
              final bool isSelected = currentRoute == item.route;
              return AppDrawerItem(
                icon: item.icon,
                title: item.title,
                route: item.route,
                isSelected: isSelected,
                onTap: _onTap,
              );
            }),
            if (sectionIndex < _sections.length - 1) const Divider(height: 1, thickness: 1),
          ],
        );
      },
    );
  }
}

class DrawerSection {
  final String header;
  final List<DrawerItem> items;

  const DrawerSection({
    required this.header,
    required this.items,
  });
}

class DrawerItem {
  final IconData icon;
  final String title;
  final String route;

  const DrawerItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}
