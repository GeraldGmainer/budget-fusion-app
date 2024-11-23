import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'budget_tab.dart';
import 'home_tab.dart';
import 'investment_tab.dart';
import 'profile_tab.dart';

class MockupPage extends StatefulWidget {
  @override
  _MockupPageState createState() => _MockupPageState();
}

class _MockupPageState extends State<MockupPage> {
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
      setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _tabs,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColors.secondaryTextColor, width: 0.3),
            ),
          ),
          child: BottomNavigationBar(
            selectedFontSize: 0,
            unselectedFontSize: 0,
            type: BottomNavigationBarType.fixed,
            items: [
              _buildBottomNavigationBarItem(Icons.home, 'Home', 0),
              _buildBottomNavigationBarItem(Icons.pie_chart, 'Budget', 1),
              _buildCustomAddButton(),
              _buildBottomNavigationBarItem(Icons.trending_up, 'Invest', 3),
              _buildBottomNavigationBarItem(Icons.person, 'Profile', 4),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            iconSize: 22,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      label: '',
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildCustomAddButton() {
    return BottomNavigationBarItem(
      label: '',
      icon: InkWell(
        onTap: () => _onItemTapped(2),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.add, color: Colors.white, size: 22),
        ),
      ),
    );
  }
}
