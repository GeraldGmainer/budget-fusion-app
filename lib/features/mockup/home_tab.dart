import 'package:budget_fusion_app/features/mockup/recent_transactions.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'dynamic_sliver_app_bar.dart';
import 'monthly_balance.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        DynamicSliverAppBar(
          pinned: true,
          toolbarHeight: kToolbarHeight,
          leading: Icon(
            Icons.account_circle,
            color: AppColors.secondaryTextColor,
            size: 44,
          ),
          automaticallyImplyLeading: false,
          title: Row(
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Hello User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [Color(0xFF1565C0), Color(0xFF42A5F5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + kToolbarHeight,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: MonthlyBalance(),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    color: AppColors.secondaryColor,
                    child: ListTile(
                      dense: true,
                      leading: const Icon(Icons.pending_actions, color: AppColors.accentColor),
                      title: const Text(
                        'Monthly Report',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text(
                        'Review your spending for this month to stay on track.',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: AppColors.accentColor),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                RecentTransactions(),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
      ],
    );
  }
}
