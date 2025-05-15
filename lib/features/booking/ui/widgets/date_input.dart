import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class DateInput extends StatelessWidget {
  final BookingDraft draft;

  const DateInput({super.key, required this.draft});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.calendar_today),
      title: Text(DateTimeConverter.todMMMMYYY(draft.date)),
      subtitle: const Text("Date"),
      contentPadding: EdgeInsets.only(left: 16.0, right: 12),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => _onQuickTap(context, -1),
            padding: EdgeInsets.zero,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => _onQuickTap(context, 1),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
      onTap: () => _showDatePicker(context),
    );
  }

  _onQuickTap(BuildContext context, int count) {
    final date = draft.date.add(Duration(days: count));
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: date));
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (sheetCtx) {
        final theme = Theme.of(context);
        final today = DateTime.now();
        return Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 8,
                children: [
                  ActionChip(
                    // TODO translation
                    label: const Text("Today"),
                    onPressed: () => Navigator.of(sheetCtx).pop(today),
                  ),
                  ActionChip(
                    label: const Text("Yesterday"),
                    onPressed: () {
                      final yesterday = today.subtract(const Duration(days: 1));
                      Navigator.of(sheetCtx).pop(yesterday);
                    },
                  ),
                  ActionChip(
                    label: const Text("2 days ago"),
                    onPressed: () {
                      final twoDaysAgo = today.subtract(const Duration(days: 2));
                      Navigator.of(sheetCtx).pop(twoDaysAgo);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                DateTimeConverter.toEEEEdMMMMYYY(draft.date),
                style: theme.textTheme.titleMedium,
              ),
            ),
            const Divider(height: 16),
            CalendarDatePicker(
              initialDate: draft.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              initialCalendarMode: DatePickerMode.day,
              onDateChanged: (date) => Navigator.of(sheetCtx).pop(date),
            ),
          ],
        );
      },
    );

    if (picked != null && context.mounted) {
      context.read<BookingSaveCubit>().updateDraft((d) => d.copyWith(date: picked));
    }
  }
}
