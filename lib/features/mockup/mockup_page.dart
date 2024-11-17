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
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    HomeTab(),
    BudgetTab(),
    Container(), // Placeholder for FAB action
    InvestmentTab(),
    ProfileTab(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      _createBooking();
    } else {
      setState(() {
        _selectedIndex = index;
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
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Budget'),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.blue,
                color: AppColors.accentColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 30),
            ),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: 'Invest'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
