import 'package:flutter/material.dart';

import '../../../budget/budget.dart';
import '../../../home/home.dart';
import '../../../invest/invest.dart';
import '../../../profile/profile.dart';
import '../bottom_nav/main_bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  static const String route = "MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    BudgetTab(),
    Container(),
    InvestmentTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _createBooking();
    } else {
      _changeTab(index);
    }
  }

  void _createBooking() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create Booking'),
        content: Text('Booking creation functionality goes here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _changeTab(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabs,
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        onItemTapped: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
