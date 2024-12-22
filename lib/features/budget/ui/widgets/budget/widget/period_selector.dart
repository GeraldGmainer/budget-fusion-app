import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/logging/logger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/application.dart';
import '../../../../domain/domain.dart';

class PeriodSelector extends StatelessWidget {
  final BudgetBookFilter filter;
  final BookingDateRange dateRange;
  final PageController paginatedController;

  const PeriodSelector({super.key, required this.filter, required this.dateRange, required this.paginatedController});

  void _onPrevious(BuildContext context) {
    final bookingPageState = context.read<BookingPageBloc>().state;
    final viewItems = bookingPageState.viewItems;
    if (paginatedController.hasClients) {
      paginatedController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO send to sentry without ${paginatedController.page!.round()} / ${viewItems.length}
      BudgetLogger.instance.w("cannot navigate to next page: ${paginatedController.page!.round()} / ${viewItems.length}");
    }
  }

  void _onNext(BuildContext context) {
    if (paginatedController.hasClients && paginatedController.page! > 0) {
      paginatedController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPrevious(context),
        _buildPeriod(context),
        _buildNext(context),
      ],
    );
  }

  Widget _buildPrevious(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.chevron_left, color: AppColors.secondaryTextColor),
      onPressed: () {
        _onPrevious(context);
      },
    );
  }

  Widget _buildNext(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.chevron_right, color: AppColors.secondaryTextColor),
      onPressed: () {
        _onNext(context);
      },
    );
  }

  Widget _buildPeriod(BuildContext context) {
    return Text(
      _formatDateRange(context, filter.period, dateRange),
      style: TextStyle(
        fontSize: 18,
        color: AppColors.primaryTextColor,
      ),
    );
  }

  String _formatDateRange(BuildContext context, PeriodMode periodMode, BookingDateRange dateRange) {
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

      default:
        return tr('unknown_period');
    }
  }
}
