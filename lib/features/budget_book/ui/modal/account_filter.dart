import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../../repos/account/account.dart';
import '../../view_models/budget_book_filter.dart';

class AccountFilter extends StatelessWidget {
  final BudgetBookFilter filter;

  const AccountFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return RepoList<Account>(
      builder: (context, data) {
        return FilterChipGroup(
          title: 'Accounts',
          items: data,
          selectedItem: filter.account,
          valueToString: (Account? data) => data?.name ?? "Unknown",
          onItemSelected: (Account? value) {
            filter.account = value;
          },
        );
      },
    );
  }
}
