import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';

class QueueTab extends StatelessWidget {
  const QueueTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfflineFirstQueueCubit, OfflineFirstQueueState>(
      builder:
          (context, state) => state.maybeWhen(
            loaded: (items, logs) {
              if (logs.isEmpty) return const Center(child: Text('No queue activity'));
              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: logs.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (_, i) {
                  final e = logs[i];
                  final color = ofType(e.entityType);
                  return ListTile(
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: e.entityType.name, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
                          const TextSpan(text: ' • '),
                          TextSpan(text: e.taskType.name, style: const TextStyle(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    subtitle: Text(
                      '${e.entityType.name} • ${e.taskType.name} • attempt ${e.attempt}\n'
                      'id: ${e.entityId}\n'
                      '${e.pauseReason ?? e.note ?? e.at.toLocal().toString()}',
                    ),
                    isThreeLine: true,
                    trailing: Chip(
                      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2),
                      visualDensity: VisualDensity.compact,
                      label: Text(_eventShort(e.event)),
                      backgroundColor: _eventColor(e.event).withValues(alpha: 0.15),
                      labelStyle: TextStyle(color: _eventColor(e.event)),
                    ),
                  );
                },
              );
            },
            orElse: () => const Center(child: CircularProgressIndicator()),
          ),
    );
  }

  String _eventShort(QueueLogEvent e) {
    switch (e) {
      case QueueLogEvent.added:
        return 'added';
      case QueueLogEvent.processing:
        return 'processing';
      case QueueLogEvent.retried:
        return 'retry';
      case QueueLogEvent.succeeded:
        return 'ok';
      case QueueLogEvent.failed:
        return 'failed';
    }
  }

  Color _eventColor(QueueLogEvent e) {
    switch (e) {
      case QueueLogEvent.added:
        return Colors.grey;
      case QueueLogEvent.processing:
        return Colors.blue;
      case QueueLogEvent.retried:
        return Colors.orange;
      case QueueLogEvent.succeeded:
        return Colors.green;
      case QueueLogEvent.failed:
        return Colors.red;
    }
  }

  static Color ofName(String name) => byName[name] ?? Colors.grey;

  static Color ofType(EntityType type) => ofName(type.name);

  static final Map<String, Color> byName = {
    'queue': Color(0xFFBDBDBD),
    'sync': Color(0xFFBDBDBD),
    'realtime': Color(0xFFBDBDBD),
    'profile': Color(0xFF00AF00),
    'account': Color(0xFF0087D7),
    'category': Color(0xFFFFAF00),
    'booking': Color(0xFFAF5FAF),
    'currency': Color(0xFFFFD700),
  };
}
