import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../widgets/budget_overview.dart';
import '../widgets/recent_transactions.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final toolbarPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return CustomScrollView(
      slivers: [
        DynamicSliverAppBar(
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: AppDrawerButton(),
          backgroundColor: AppColors.primaryColor,
          flexibleSpace: _buildFlexibleSpace(
            topPadding: toolbarPadding,
            child: BudgetOverview(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.horizontalPadding, vertical: AppDimensions.verticalPadding),
          sliver: SliverToBoxAdapter(child: RecentTransactions()),
        ),
      ],
    );
  }

  Widget _buildFlexibleSpace({required Widget child, required double topPadding}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [AppColors.linearGradient1, AppColors.linearGradient2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, left: 6, right: 6, bottom: 8),
        child: child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
