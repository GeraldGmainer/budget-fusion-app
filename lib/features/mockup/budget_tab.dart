import 'package:budget_fusion_app/features/mockup/graph_view.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class BudgetTab extends StatefulWidget {
  @override
  _BudgetTabState createState() => _BudgetTabState();
}

class _BudgetTabState extends State<BudgetTab> {
  String _selectedAccount = 'all accounts';
  String _selectedView = 'Category Summary';
  String _selectedTab = 'Outcome';
  final List<String> _accounts = ['all accounts', 'cash', 'credit card'];
  final List<String> _views = ['Category Summary', 'Booking List', 'Balance Chart', 'Calendar'];
  final List<String> _tabs = ['Income', 'Outcome'];

  void _onAccountSelected(String account) {
    setState(() {
      _selectedAccount = account;
    });
    Navigator.pop(context); // Close the drawer
  }

  void _onViewSelected(String view) {
    setState(() {
      _selectedView = view;
    });
    Navigator.pop(context); // Close the drawer
  }

  void _onTabSelected(String tab) {
    setState(() {
      _selectedTab = tab;
    });
    Navigator.pop(context); // Close the drawer
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
              '$_selectedTab for ${_selectedAccount == 'all accounts' ? 'All Accounts' : _selectedAccount}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Builder(
                builder: (context) {
                  switch (_selectedView) {
                    case 'List View':
                      return const Text('List View Content');
                    case 'Line Chart':
                      return const Text('Line Chart Content');
                    case 'Calendar':
                      return const Text('Calendar Content');
                    default:
                      return GraphView(month: "May 2024");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                // color: Color(0xFF6A1B9A),
                gradient: LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Text(
                'Budget Options',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          _buildDrawerSection(
            title: 'Select Income/Outcome',
            items: _tabs,
            selectedItem: _selectedTab,
            onItemSelected: _onTabSelected,
          ),
          const Divider(),
          _buildDrawerSection(
            title: 'Select View',
            items: _views,
            selectedItem: _selectedView,
            onItemSelected: _onViewSelected,
          ),
          const Divider(),
          _buildDrawerSection(
            title: 'Select Account',
            items: _accounts,
            selectedItem: _selectedAccount,
            onItemSelected: _onAccountSelected,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerSection({
    required String title,
    required List<String> items,
    required String selectedItem,
    required void Function(String) onItemSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        //   child: Text(
        //     title,
        //     style: const TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.grey,
        //     ),
        //   ),
        // ),
        ...items.map((item) {
          final isSelected = selectedItem == item;
          return ListTile(
            leading: isSelected ? const Icon(Icons.check, color: AppColors.accentColor) : const SizedBox(width: 24),
            title: Text(
              item,
              style: TextStyle(
                color: isSelected ? AppColors.accentColor : AppColors.primaryTextColor,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            onTap: () => onItemSelected(item),
          );
        }).toList(),
      ],
    );
  }
}
