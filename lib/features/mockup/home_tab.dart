import 'package:budget_fusion_app/features/mockup/monthly_balance.dart';
import 'package:budget_fusion_app/features/mockup/recent_transactions.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const paddingTop = kToolbarHeight + 50;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 375.0,
          pinned: true,
          title: Row(
            children: [
              Icon(
                Icons.account_circle,
                color: AppColors.secondaryTextColor,
                size: 44,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Hello User!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black54,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              )
            ],
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: const [Color(0xFF1565C0), Color(0xFF42A5F5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 80.0),
                padding: EdgeInsets.only(top: paddingTop, left: 16, right: 16),
                child: MonthlyBalance(),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
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
                        // style: TextStyle(fontSize: 13),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: AppColors.accentColor),
                        onPressed: () {
                          // Add your logic to navigate to the report
                        },
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
