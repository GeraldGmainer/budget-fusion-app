import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../../features/analytics/analytics.dart';
import '../../../features/budget_book/budget_book.dart';
import '../../../features/budget_goals/budget_goals.dart';
import '../../../features/overview/home.dart';
import '../../main.dart';
import '../widgets/double_back_to_close.dart';
import '../widgets/main_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  late final List<Widget> _tabs;
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

    FlutterNativeSplash.remove();
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
      listener: (context, state) => state.whenOrNull(tabChange: _onTabChange),
      child: Scaffold(
        drawer: const AppDrawer(),
        bottomNavigationBar: MainBottomNavigationBar(),
        body: DoubleBackToClose(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _tabs,
          ),
        ),
      ),
    );
  }
}
