import 'package:flutter/material.dart';

import '../screens/booking_tab.dart';
import '../screens/category_tab.dart';
import '../screens/queue_tab.dart';

class DebugPage extends StatelessWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Debug'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Queue'),
              Tab(text: 'Categories'),
              Tab(text: 'Bookings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            QueueTab(),
            CategoriesTab(),
            BookingsTab(),
          ],
        ),
      ),
    );
  }
}
