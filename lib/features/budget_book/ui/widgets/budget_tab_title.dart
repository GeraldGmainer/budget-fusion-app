import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/domain/enums/period_mode.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/budget_book_cubit.dart';
import '../../domain/entities/budget_book_filter.dart';

class BudgetTabTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetBookCubit, BudgetBookState>(
      builder: (context, state) {
        return _buildTitle(state.filter);
      },
    );
  }

  Widget _buildTitle(BudgetBookFilter filter) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('budgetBook.title'.tr(), style: TextStyle(fontSize: 20)),
        Text(_buildSubtitle(filter), style: const TextStyle(fontSize: 14, color: Colors.white70)),
      ],
    );
  }

  String _buildSubtitle(BudgetBookFilter filter) {
    if (filter.transaction != null && filter.account != null) {
      return tr('budgetBook.subtitle.transactionAccount', args: [filter.transaction!.label.tr(), filter.account!.name]);
    } else if (filter.transaction != null) {
      return tr('budgetBook.subtitle.outcomesPeriod', args: [filter.transaction!.label.tr()]);
    } else if (filter.account != null) {
      return tr('budgetBook.subtitle.allTransactionsAccount', args: [filter.account!.name]);
    } else {
      return tr('budgetBook.subtitle.allTransactionsPeriod', args: [filter.period.label.tr()]);
    }
  }
}
