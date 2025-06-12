import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../enums/period_mode.dart';
import '../../view_models/budget_book_filter.dart';
import '../../view_models/budget_date_range.dart';

class PeriodSelector extends StatelessWidget {
  final BudgetBookFilter filter;
  final BudgetDateRange dateRange;
  final PageController pageController;

  const PeriodSelector({super.key, required this.filter, required this.pageController, required this.dateRange});

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
      BudgetLogger.instance.w("PeriodSelector cannot navigate to next page: page <= 0");
      return;
    }
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [_buildPrevious(context), _buildPeriod(context), _buildNext(context)]);
  }

  Widget _buildPrevious(BuildContext context) {
    return IconButton(icon: Icon(Icons.chevron_left, color: AppColors.secondaryTextColor), onPressed: () => _onPrevious(context));
  }

  Widget _buildNext(BuildContext context) {
    final pc = pageController;
    final page = pc.hasClients && pc.positions.isNotEmpty ? pc.page ?? pc.initialPage.toDouble() : pc.initialPage.toDouble();
    final isEnd = page < 0.5;
    final color = isEnd ? AppColors.disabledTextColor : AppColors.secondaryTextColor;
    return IconButton(icon: Icon(Icons.chevron_right, color: color), onPressed: isEnd ? null : () => _onNext(context));
  }

  Widget _buildPeriod(BuildContext context) {
    return GestureDetector(
      onTap: () => context.showComingSoon(),
      child: Text(_formatDateRange(context, filter.period), style: TextStyle(fontSize: 18, color: AppColors.primaryTextColor)),
    );
  }

  String _formatDateRange(BuildContext context, PeriodMode periodMode) {
    switch (periodMode) {
      case PeriodMode.all:
        return tr('all');

      case PeriodMode.year:
        return tr('year', args: [dateRange.from.year.toString()]);

      case PeriodMode.month:
        final currentYear = DateTime.now().year;
        final monthName = DateFormat.MMMM(context.locale.toString()).format(dateRange.from);
        if (dateRange.from.year == currentYear) {
          return monthName;
        } else {
          return "$monthName ${dateRange.from.year}";
        }

      case PeriodMode.day:
        return DateFormat.yMMMMd(context.locale.toString()).format(dateRange.from);
    }
  }
}
