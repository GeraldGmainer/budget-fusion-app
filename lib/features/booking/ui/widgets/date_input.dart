import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class DateInput extends StatefulWidget {
  final BookingDraft draft;

  const DateInput({required this.draft});

  @override
  State<DateInput> createState() => _DateInputState();
}

// TODO not stateful?
class _DateInputState extends State<DateInput> {
  // _onDatePicker(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null && picked != _selectedDate) {
  //     setState(() {
  //       _selectedDate = picked;
  //     });
  //     if (context.mounted) {
  //       context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: picked));
  //     }
  //   }
  // }

  _onQuickTap(BuildContext context, int count) {
    final date = widget.draft.date.add(Duration(days: count));
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: date));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text(DateTimeConverter.todMMMMYYY(widget.draft.date)),
          // TODO translation
          subtitle: Text("Date"),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => _onQuickTap(context, 1),
                child: Padding(padding: const EdgeInsets.all(2.0), child: const Icon(Icons.expand_less)),
              ),
              InkWell(
                onTap: () => _onQuickTap(context, -1),
                child: Padding(padding: const EdgeInsets.all(2.0), child: const Icon(Icons.expand_more)),
              ),
            ],
          ),
        ),
      ],
    );
  }

// _buildDatePicker() {
//   return TextButton(
//     onPressed: () {
//       _onDatePicker(context);
//     },
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Icon(Icons.edit_calendar, color: AppColors.primaryTextColor),
//         const SizedBox(width: 8),
//         AnimatedSwitcher(
//           duration: const Duration(milliseconds: 300),
//           transitionBuilder: (child, animation) {
//             return FadeTransition(opacity: animation, child: child);
//           },
//           child: Text(
//             key: ValueKey(_selectedDate),
//             DateTimeConverter.toEEEEdMMMM(_selectedDate),
//             style: const TextStyle(color: AppColors.primaryTextColor, fontSize: 16),
//           ),
//         ),
//       ],
//     ),
//   );
// }
}
