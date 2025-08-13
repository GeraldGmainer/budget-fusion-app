import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core.dart';

class EntityMetaWidget<T extends Entity> extends StatelessWidget {
  final Uuid id;
  final EdgeInsets padding;
  final Repo<T> repo;

  const EntityMetaWidget({
    super.key,
    required this.id,
    required this.repo,
    this.padding = const EdgeInsets.fromLTRB(0, 8, 0, 12),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntityMetaCubit<T>>(
      create:
          (_) => EntityMetaCubit<T>(
            repo: repo,
            queueManager: getIt<QueueManager>(),
            id: id.value,
          )..init(),
      child: _EntityMetaInner<T>(padding: padding),
    );
  }
}

class _EntityMetaInner<T extends Entity> extends StatelessWidget {
  final EdgeInsets padding;

  const _EntityMetaInner({required this.padding});

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.64);
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(color: onSurface, letterSpacing: .2);

    return Padding(
      padding: padding,
      child: BlocBuilder<EntityMetaCubit<T>, EntityMetaState>(
        builder: (_, state) {
          return state.when(
            loading: () => const SizedBox.shrink(),
            created: () => const SizedBox.shrink(),
            error: (_) => _row(style, Colors.red, 'Error'),
            upserted: (m) {
              final label = m.isFailed ? 'Delete failed' : (m.isPendingDelete ? 'Deleting…' : (m.isPending ? 'Pending' : 'Up to date'));
              final color = m.isFailed ? Colors.red : (m.isPendingDelete ? Colors.orange : (m.isPending ? Colors.orange : Colors.green));
              final parts = <Widget>[
                Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                const SizedBox(width: 6),
                Text(label, style: style),
              ];
              if (m.updatedAt != null) {
                parts.addAll([
                  const SizedBox(width: 8),
                  Text('•', style: style),
                  const SizedBox(width: 8),
                  Icon(CommunityMaterialIcons.calendar_plus, size: 14, color: onSurface),
                  const SizedBox(width: 4),
                  Text(_relative(m.updatedAt!), style: style),
                ]);
              }
              if (m.createdAt != null) {
                parts.addAll([
                  const SizedBox(width: 8),
                  Text('•', style: style),
                  const SizedBox(width: 8),
                  Icon(CommunityMaterialIcons.calendar_edit, size: 14, color: onSurface),
                  const SizedBox(width: 4),
                  Text(DateFormat('dd.MM.yyyy').format(m.createdAt!.toLocal()), style: style),
                ]);
              }
              return Row(children: parts);
            },
          );
        },
      ),
    );
  }

  static Widget _row(TextStyle? style, Color dot, String label) {
    return Row(
      children: [
        Container(width: 6, height: 6, decoration: BoxDecoration(color: dot, shape: BoxShape.circle)),
        const SizedBox(width: 6),
        Text(label, style: style),
      ],
    );
  }

  static String _relative(DateTime dt) {
    final d = DateTime.now().difference(dt);
    if (d.inMinutes < 1) return 'just now';
    if (d.inMinutes < 60) return '${d.inMinutes}m ago';
    if (d.inHours < 24) return '${d.inHours}h ago';
    return DateFormat('dd.MM.yyyy').format(dt.toLocal());
  }
}
