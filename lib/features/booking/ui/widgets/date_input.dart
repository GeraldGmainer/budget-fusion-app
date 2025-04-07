import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/save_booking_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class DateInput extends StatefulWidget {
  final BookingDraft model;
  final bool hideQuickButtons;

  const DateInput({required this.model, required this.hideQuickButtons});

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
        context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(date: picked));
      }
    }
  }

  _onQuickPressed(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
    context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(date: date));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDatePicker(),
        if (!widget.hideQuickButtons) _buildQuickButtons(),
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
          Text(
            DateTimeConverter.toEEEEdMMMM(_selectedDate),
            style: const TextStyle(color: AppColors.primaryTextColor, fontSize: 16),
          ),
        ],
      ),
    );
  }

  _buildQuickButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickButton(0, "booking.today"),
        const SizedBox(width: 8),
        _buildQuickButton(-1, "booking.yesterday"),
        const SizedBox(width: 8),
        _buildQuickButton(-2, "booking.before_yesterday"),
      ],
    );
  }

  _buildQuickButton(int dayDiff, String subtext) {
    final date = now.add(Duration(days: dayDiff));

    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _onQuickPressed(date);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          backgroundColor: AppColors.secondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(DateTimeConverter.toMMdd(date), style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            // Text(subtext, style: const TextStyle(color: AppColors.secondaryTextColor, fontSize: 13.0)).tr(),
            Text(subtext, style: const TextStyle(fontSize: 14.0)).tr(),
          ],
        ),
      ),
    );
  }
}
