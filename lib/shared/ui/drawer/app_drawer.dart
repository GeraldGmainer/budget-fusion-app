import 'package:budget_fusion_app/core/core.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';
import 'drawer_item.dart';
import 'drawer_section.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  final List<DrawerSection> _sections = const [
    DrawerSection(
      header: 'Main',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.home_variant, title: 'Home', route: AppRoutes.main),
        DrawerItem(icon: CommunityMaterialIcons.chart_line, title: 'Investments'),
        DrawerItem(icon: CommunityMaterialIcons.chart_bar, title: 'Predictions'),
        DrawerItem(icon: CommunityMaterialIcons.shopping, title: 'Shopping List'),
      ],
    ),
    DrawerSection(
      header: 'Financial Management',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.bank, title: 'Accounts'),
        DrawerItem(icon: CommunityMaterialIcons.table_large, title: 'Categories', route: AppRoutes.categoryList),
        DrawerItem(icon: CommunityMaterialIcons.repeat, title: 'Recurring Transactions'),
        DrawerItem(icon: CommunityMaterialIcons.flag_variant, title: 'Budget Goals'),
        DrawerItem(icon: CommunityMaterialIcons.death_star, title: 'Debts'),
      ],
    ),
    DrawerSection(
      header: 'Collaboration',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.account_group, title: 'Workspace'),
      ],
    ),
    DrawerSection(
      header: 'Other',
      items: [
        DrawerItem(icon: CommunityMaterialIcons.crown, title: 'Get Pro'),
        DrawerItem(icon: CommunityMaterialIcons.web, title: 'Open Webpage'),
        DrawerItem(icon: CommunityMaterialIcons.cog_outline, title: 'Settings', route: '/settings'),
        DrawerItem(icon: CommunityMaterialIcons.help_circle, title: 'Support'),
      ],
    ),
  ];

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
    final currentRoute = ModalRoute.of(context)?.settings.name;

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
  final String? route;

  const DrawerItem({
    required this.icon,
    required this.title,
    this.route,
  });
}
