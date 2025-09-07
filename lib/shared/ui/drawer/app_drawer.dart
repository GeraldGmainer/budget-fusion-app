import 'package:budget_fusion_app/core/core.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'app_drawer_header.dart';
import 'app_drawer_item.dart';
import 'app_drawer_section.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  static const List<DrawerSection> _sections = [
    DrawerSection(
      header: 'Main',
      items: [
        DrawerItem(
          icon: CommunityMaterialIcons.home_variant,
          title: 'Home',
          route: AppRoutes.main,
          color: Color(0xFF64B5F6), // light-blue
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.chart_line,
          title: 'Investments',
          color: Color(0xFF9575CD), // medium-purple
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.chart_bar,
          title: 'Predictions',
          color: Color(0xFFFFB74D), // light-orange
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.shopping,
          title: 'Shopping List',
          color: Color(0xFF4DB6AC), // teal
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.android,
          title: 'Debug',
          color: Color(0xFFa4c639),
          route: AppRoutes.debug,
        ),
      ],
    ),
    DrawerSection(
      header: 'Financial Management',
      items: [
        DrawerItem(
          icon: CommunityMaterialIcons.bank,
          title: 'Accounts',
          color: Color(0xFF7986CB), // indigo
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.table_large,
          title: 'Categories',
          route: AppRoutes.categoryList,
          color: Color(0xFFFFCC80), // pale-amber
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.repeat,
          title: 'Recurring Transactions',
          color: Color(0xFF81C784), // green
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.flag_variant,
          title: 'Budget Goals',
          color: Color(0xFFE57373), // red-light
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.death_star,
          title: 'Debts',
          color: Color(0xFFE57373), // same red for debt
        ),
      ],
    ),
    DrawerSection(
      header: 'Collaboration',
      items: [
        DrawerItem(
          icon: CommunityMaterialIcons.account_group,
          title: 'Workspace',
          color: Color(0xFF4FC3F7), // light-cyan
        ),
      ],
    ),
    DrawerSection(
      header: 'Other',
      items: [
        DrawerItem(
          icon: CommunityMaterialIcons.crown,
          title: 'Get Pro',
          color: Color(0xFFFFF176), // yellow
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.web,
          title: 'Open Webpage',
          color: Color(0xFF90A4AE), // blue-grey
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.cog_outline,
          title: 'Settings',
          route: '/settings',
          color: Color(0xFFB0BEC5), // light-grey
        ),
        DrawerItem(
          icon: CommunityMaterialIcons.help_circle,
          title: 'Support',
          color: Color(0xFF80CBC4), // pale-teal
        ),
        DrawerItem(icon: CommunityMaterialIcons.reddit, title: 'Budget Fusion Reddit', url: 'https://www.reddit.com/'),
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
              return AppDrawerItem(icon: item.icon, title: item.title, route: item.route, isSelected: isSelected, color: item.color, url: item.url);
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

  const DrawerSection({required this.header, required this.items});
}

class DrawerItem {
  final IconData icon;
  final String title;
  final String? route;
  final Color? color;
  final String? url;

  const DrawerItem({required this.icon, required this.title, this.route, this.color, this.url});
}
