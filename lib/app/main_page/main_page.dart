import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/budget/budget.dart';
import '../../features/home/home.dart';
import '../../features/invest/invest.dart';
import '../../features/profile/profile.dart';
import 'bloc/main_bloc.dart';
import 'bottom_navigation_bar/main_bottom_navigation_bar.dart';
import 'bottom_navigation_bar/main_bottom_navigation_bar_item.dart';
import 'bottom_navigation_bar/main_bottom_navigation_create_item.dart';
import 'bottom_navigation_bar/main_bottom_navigation_tab_item.dart';

class MainPage extends StatefulWidget {
  static const String route = "MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  final List<Widget> _tabs = [
    HomeTab(),
    BudgetTab(),
    Container(),
    InvestTab(),
    ProfileTab(),
  ];
  late final List<MainBottomNavigationBarItem> _items;

  @override
  void initState() {
    super.initState();
    _items = [
      MainBottomNavigationTabItem(
        icon: Icons.home,
        label: 'Home',
        tabIndex: 0,
      ),
      MainBottomNavigationTabItem(
        icon: Icons.pie_chart,
        label: 'Budget',
        tabIndex: 1,
      ),
      MainBottomNavigationCreateItem(
        onTap: _createBooking,
      ),
      MainBottomNavigationTabItem(
        icon: Icons.trending_up,
        label: 'Invest',
        tabIndex: 3,
      ),
      MainBottomNavigationTabItem(
        icon: Icons.person,
        label: 'Profile',
        tabIndex: 4,
      ),
    ];
  }

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
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        state.whenOrNull(tabChange: _onTabChange);
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _tabs,
        ),
        bottomNavigationBar: MainBottomNavigationBar(items: _items),
      ),
    );
  }
}
