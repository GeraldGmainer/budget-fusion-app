import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'graph_view.dart';

class BudgetTab extends StatefulWidget {
  @override
  _BudgetTabState createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> {
  String _selectedAccount = 'all accounts';
  String _selectedTab = 'Outcome';
  String _selectedPeriod = 'Month';
  int _selectedNavIndex = 0;

  final List<String> _periods = ['Day', 'Week', 'Month', 'Year', 'All'];
  final List<String> _tabs = ['Income', 'Outcome'];
  final List<String> _navItems = ['Summary', 'Transactions', 'Balances', 'Calendar'];

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Transaction Type', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(
                children: _tabs.map((tab) {
                  final isSelected = _selectedTab == tab;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = tab;
                      });
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected ? AppColors.accentColor : AppColors.secondaryColor,
                      ),
                      child: Text(
                        tab,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text('Period', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _periods.map((period) {
                  final isSelected = _selectedPeriod == period;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPeriod = period;
                      });
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: isSelected ? AppColors.accentColor : AppColors.secondaryColor,
                      ),
                      child: Text(
                        period,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Budget Book',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_selectedTab for ${_selectedAccount == 'all accounts' ? 'All Accounts' : _selectedAccount} - $_selectedPeriod',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilters,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildScrollableNavBar(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "May 2024",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.accentColor,
                ),
              ),
              SizedBox(width: 8),
              Text("345,19€", style: TextStyle(color: Colors.green, fontSize: 20)),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _getSelectedView(),
          ),
        ],
      ),
    );
  }

  Widget _buildScrollableNavBar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(top: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(_navItems.length, (index) {
            final isSelected = _selectedNavIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedNavIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? AppColors.secondaryColor : Colors.transparent,
                ),
                child: Text(
                  _navItems[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _getSelectedView() {
    switch (_selectedNavIndex) {
      case 0:
        return GraphView();
      case 1:
        return const Center(child: Text('List View Content'));
      case 2:
        return const Center(child: Text('Line Chart Content'));
      case 3:
        return const Center(child: Text('Calendar Content'));
      default:
        return const Center(child: Text('Unknown View'));
    }
  }
}
