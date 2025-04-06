import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/budget_book_filter.dart';

class AccountFilter extends StatelessWidget {
  final BudgetBookFilter filter;

  const AccountFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, LoadableState>(
      builder: (context, state) {
        return state.maybeWhen(
            loaded: (data) => FilterChipGroup(
                  title: 'Accounts',
                  items: data,
                  selectedItem: filter.account,
                  valueToString: (data) => data?.name ?? "Unknown",
                  onItemSelected: (Account? value) {
                    filter.account = value;
                  },
                ),
            orElse: () => SizedBox());
      },
    );
  }
}
