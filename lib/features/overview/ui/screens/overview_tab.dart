import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../shared/shared.dart';
import '../widgets/widgets.dart';

class OverviewTab extends StatefulWidget {
  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final toolbarPadding = MediaQuery.of(context).padding.top + kToolbarHeight;

    return CustomScrollView(
      slivers: [
        DynamicSliverAppBar(
          title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          leading: AppDrawerButton(),
          actions: [Notifications()],
          backgroundColor: AppColors.primaryColor,
          flexibleSpace: _buildFlexibleSpace(
            topPadding: toolbarPadding,
            child: BudgetOverview(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
          sliver: SliverToBoxAdapter(child: Reports()),
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
          colors: const [AppColors.linearGradient1, AppColors.linearGradient2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: topPadding, left: 16, right: 16, bottom: 8),
        child: child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
