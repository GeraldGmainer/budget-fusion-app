import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/supabase/supabase.dart';

class AnalyticsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('Analytics'), if (!kReleaseMode) _buildRefreshButton()],
        ),
      ),
    );
  }

  Widget _buildRefreshButton() {
    return ElevatedButton(
      onPressed: () {
        supabase.refreshToken(forceRefresh: true);
      },
      child: Text("refresh token"),
    );
  }
}
