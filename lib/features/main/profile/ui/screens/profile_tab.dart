import 'package:budget_fusion_app/features/settings/settings.dart';
import 'package:flutter/material.dart';

import '../info/profile_info.dart';

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 90.0,
            pinned: true,
            flexibleSpace: _buildFlexibleSpace(child: ProfileInfo()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(child: ProfileSettingScreen()),
        ],
      ),
    );
  }

  Widget _buildFlexibleSpace({required Widget child}) {
    return FlexibleSpaceBar(
      titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
      title: child,
      background: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
