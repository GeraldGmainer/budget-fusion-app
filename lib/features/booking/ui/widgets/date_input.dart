import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class DateInput extends StatefulWidget {
  final BookingDraft model;

  const DateInput({required this.model});

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  late DateTime _selectedDate;
  final DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.model.date;
  }

  _onDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      if (context.mounted) {
        context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: picked));
      }
    }
  }

  _onQuickPressed(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: date));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDatePicker(),
      ],
    );
  }

  _buildDatePicker() {
    return TextButton(
      onPressed: () {
        _onDatePicker(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.edit_calendar, color: AppColors.primaryTextColor),
          const SizedBox(width: 8),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: Text(
              key: ValueKey(_selectedDate),
              DateTimeConverter.toEEEEdMMMM(_selectedDate),
              style: const TextStyle(color: AppColors.primaryTextColor, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
