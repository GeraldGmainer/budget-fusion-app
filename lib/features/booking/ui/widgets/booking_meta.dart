import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../repos/booking/booking.dart';

class BookingMeta extends StatelessWidget {
  final Booking booking;

  const BookingMeta({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.64);
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(color: onSurface, letterSpacing: .2);
    final label = booking.isSynced ? 'Synced' : 'Pending';
    final color = booking.isSynced ? Colors.green : Colors.orange;
    final created = booking.createdAt;
    final updated = booking.updatedAt;

    final children = <Widget>[
      Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
      const SizedBox(width: 6),
      Text(label, style: style),
    ];

    if (updated != null) {
      children.addAll([
        const SizedBox(width: 8),
        Text('•', style: style),
        const SizedBox(width: 8),
        Icon(Icons.schedule, size: 12, color: onSurface),
        const SizedBox(width: 4),
        Text(_relative(updated), style: style),
      ]);
    }
    if (created != null) {
      children.addAll([
        const SizedBox(width: 8),
        Text('•', style: style),
        const SizedBox(width: 8),
        Icon(Icons.calendar_today, size: 12, color: onSurface),
        const SizedBox(width: 4),
        Text(DateFormat('dd.MM.yyyy').format(created.toLocal()), style: style),
      ]);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Column(
        children: [
          const Divider(color: AppColors.disabledTextColor),
          Row(children: children),
        ],
      ),
    );
  }

  String _relative(DateTime dt) {
    final d = DateTime.now().difference(dt);
    if (d.inMinutes < 1) return 'just now';
    if (d.inMinutes < 60) return '${d.inMinutes}m ago';
    if (d.inHours < 24) return '${d.inHours}h ago';
    return DateFormat('dd.MM.yyyy').format(dt.toLocal());
  }
}
