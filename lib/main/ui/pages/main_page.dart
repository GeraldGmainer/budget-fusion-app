import 'package:budget_fusion_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/analytics/analytics.dart';
import '../../../features/budget_book/budget_book.dart';
import '../../../features/budget_goals/budget_goals.dart';
import '../../../features/overview/home.dart';
import '../../../shared/shared.dart';
import '../../main.dart';
import '../widgets/main_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  late final List<Widget> _tabs;
  late final List<MainBottomNavigationBarItem> _items;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs = [
      HomeTab(),
      BudgetBookTab(),
      Container(),
      BudgetGoalsTab(),
      AnalyticsTab(),
    ];

    _items = [
      MainBottomNavigationTabItem(icon: Icons.home, label: 'Home', tabIndex: 0),
      MainBottomNavigationTabItem(icon: Icons.book, label: 'Budget', tabIndex: 1),
      MainBottomNavigationCreateItem(onTap: _createBooking),
      MainBottomNavigationTabItem(icon: Icons.golf_course, label: 'Goals', tabIndex: 3),
      MainBottomNavigationTabItem(icon: Icons.analytics, label: 'Analytics', tabIndex: 4),
    ];
  }

  void _createBooking() {
    Navigator.of(context).pushNamed(AppRoutes.saveBooking);
  }

  void _onTabChange(int index) {
    if (_currentIndex == index) return;

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
        drawer: const AppDrawer(),
        bottomNavigationBar: MainBottomNavigationBar(items: _items),
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _tabs,
            ),
            RemoteLoadingIndicator(),
          ],
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
