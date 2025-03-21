import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/analytics/analytics.dart';
import '../../../features/budget_book/budget_book.dart';
import '../../../features/budget_goals/budget_goals.dart';
import '../../../features/overview/home.dart';
import '../../../shared/shared.dart';
import '../../main.dart';
import '../widgets/main_bottom_navigation_bar.dart';
import '../widgets/main_bottom_navigation_bar_item.dart';
import '../widgets/main_bottom_navigation_create_item.dart';
import '../widgets/main_bottom_navigation_tab_item.dart';

class MainPage extends StatefulWidget {
  static const String route = "MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    BudgetBookTab(),
    Container(),
    BudgetGoalsTab(),
    AnalyticsTab(),
  ];
  late final List<MainBottomNavigationBarItem> _items = [
    MainBottomNavigationTabItem(icon: Icons.home, label: 'Home', tabIndex: 0),
    MainBottomNavigationTabItem(icon: Icons.book, label: 'Budget', tabIndex: 1),
    MainBottomNavigationCreateItem(onTap: _createBooking),
    MainBottomNavigationTabItem(icon: Icons.golf_course, label: 'Goals', tabIndex: 3),
    MainBottomNavigationTabItem(icon: Icons.analytics, label: 'Analytics', tabIndex: 4),
  ];

  void _createBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Booking'),
        content: const Text('Booking creation functionality goes here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _onTabChange(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        state.whenOrNull(tabChange: _onTabChange);
      },
      child: Scaffold(
        appBar: _buildAppBarForIndex(_currentIndex),
        drawer: AppDrawer(),
        bottomNavigationBar: MainBottomNavigationBar(items: _items),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs,
        ),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBarForIndex(int index) {
    if (index == 1) {
      return BudgetBookAppBar();
    }
    return null;
  }
}
