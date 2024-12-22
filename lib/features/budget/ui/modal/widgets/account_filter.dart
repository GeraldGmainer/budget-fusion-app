import 'package:flutter/material.dart';

import '../../../../../shared/shared.dart';
import '../../../domain/domain.dart';

class AccountFilter extends StatelessWidget {
  final List<String> _accounts = ['All Accounts', 'Cash', 'Credit Card'];
  final BudgetBookFilter filter;

  AccountFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return FilterChipGroup(
      title: 'Accounts',
      items: _accounts,
      // selectedItem: filter.account,
      selectedItem: 'All Accounts',
      onItemSelected: (value) {
        // TODO filter by account
        // filter.account = value;
      },
    );
  }
}
