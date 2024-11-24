import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final toolbarPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return CustomScrollView(
      slivers: [
        DynamicSliverAppBar(
          title: UserInfo(),
          actions: [HomeNotifications()],
          flexibleSpace: _buildFlexibleSpace(topPadding: toolbarPadding, child: BudgetOverview()),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          sliver: SliverToBoxAdapter(child: HomeReports()),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
          sliver: SliverToBoxAdapter(child: RecentTransactions()),
        ),
      ],
    );
  }

  Widget _buildFlexibleSpace({required Widget child, required double topPadding}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding,
          left: 16,
          right: 16,
          bottom: 8,
        ),
        child: child,
      ),
    );
  }
}
