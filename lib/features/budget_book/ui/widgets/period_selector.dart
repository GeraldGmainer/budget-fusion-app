import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/budget_book_cubit.dart';
import '../../enums/period_mode.dart';
import '../../view_models/budget_date_range.dart';

class PeriodSelector extends StatelessWidget {
  final PageController pageController;

  const PeriodSelector({super.key, required this.pageController});

  void _onPrevious(BuildContext context) {
    if (pageController.hasClients) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      BudgetLogger.instance.w("PeriodSelector cannot navigate to previous page: has no clients ?");
    }
  }

  void _onNext(BuildContext context) {
    if (!pageController.hasClients && pageController.page! > 0) {
      BudgetLogger.instance.w("PeriodSelector cannot navigate to next page: has no clients ?");
      return;
    }
    if (pageController.page! <= 0) {
      // BudgetLogger.instance.w("PeriodSelector cannot navigate to next page: page <= 0");
      return;
    }
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((BudgetBookCubit c) => c.state);
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_buildPrevious(context), _buildPeriod(context, state.dateRange), _buildNext(context)]);
  }

  Widget _buildPrevious(BuildContext context) {
    return IconButton(icon: Icon(Icons.chevron_left, color: AppColors.secondaryTextColor), onPressed: () => _onPrevious(context));
  }

  Widget _buildNext(BuildContext context) {
    return IconButton(icon: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor), onPressed: () => _onNext(context));
  }

  Widget _buildPeriod(BuildContext context, BudgetDateRange range) {
    return GestureDetector(onTap: () => context.showComingSoon(), child: Text(_formatDateRange(context, range), style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor)));
  }

  String _formatDateRange(BuildContext context, BudgetDateRange range) {
    switch (range.period) {
      case PeriodMode.all:
        return tr('all');
      case PeriodMode.year:
        return tr('year', args: [range.from.year.toString()]);
      case PeriodMode.month:
        final currentYear = DateTime.now().year;
        final monthName = DateFormat.MMMM(context.locale.toString()).format(range.from);
        if (range.from.year == currentYear) {
          return monthName;
        } else {
          return "$monthName ${range.from.year}";
        }
      case PeriodMode.day:
        return DateFormat.yMMMMd(context.locale.toString()).format(range.from);
    }
  }
}
