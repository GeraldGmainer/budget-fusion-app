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
        DrawerItem(icon: Icons.book, title: 'Home', route: '/main'),
        DrawerItem(icon: Icons.trending_up, title: 'Investments', route: '/investments'),
        DrawerItem(icon: Icons.show_chart, title: 'Predictions', route: '/predictions'),
        DrawerItem(icon: Icons.shopping_cart, title: 'Shopping List', route: '/shopping-list'),
      ],
    ),
    DrawerSection(
      header: 'Financial Management',
      items: [
        DrawerItem(icon: Icons.account_balance, title: 'Accounts', route: '/accounts'),
        DrawerItem(icon: Icons.category, title: 'Categories', route: '/categories'),
        DrawerItem(icon: Icons.repeat, title: 'Recurring Transactions', route: '/recurring-transactions'),
        DrawerItem(icon: Icons.flag, title: 'Budget Goals', route: '/budget-goals'),
        DrawerItem(icon: Icons.money_off, title: 'Debts', route: '/debts'),
      ],
    ),
    DrawerSection(
      header: 'Collaboration',
      items: [
        DrawerItem(icon: Icons.workspace_premium, title: 'Workspace', route: '/workspace'),
      ],
    ),
    DrawerSection(
      header: 'Other',
      items: [
        DrawerItem(icon: Icons.upgrade, title: 'Get Pro', route: '/get-pro'),
        DrawerItem(icon: Icons.web, title: 'Open Webpage', route: '/open-webpage'),
        DrawerItem(icon: Icons.settings, title: 'Settings', route: '/settings'),
        DrawerItem(icon: Icons.support_agent, title: 'Support', route: '/support'),
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
