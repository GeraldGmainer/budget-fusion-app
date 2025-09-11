import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core.dart';

class EntityMetaDisplay<T extends Entity> extends StatelessWidget {
  final Uuid id;
  final EdgeInsets padding;
  final Repo<T> repo;
  final bool navigateBackAfterDelete;

  const EntityMetaDisplay({
    super.key,
    required this.id,
    required this.repo,
    this.padding = const EdgeInsets.fromLTRB(0, 8, 0, 12),
    this.navigateBackAfterDelete = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EntityMetaCubit<T>>(
      create: (_) => EntityMetaCubit<T>(
        repo: repo,
        queueManager: getIt<QueueManager>(),
        id: id.value,
      )..init(),
      child: _EntityMetaInner<T>(padding: padding, navigateBackAfterDelete: navigateBackAfterDelete),
    );
  }
}

class _EntityMetaInner<T extends Entity> extends StatelessWidget {
  final EdgeInsets padding;
  final bool navigateBackAfterDelete;

  const _EntityMetaInner({required this.padding, required this.navigateBackAfterDelete});

  void _onDeleted(BuildContext context) {
    if (!navigateBackAfterDelete) return;
    BudgetLogger.instance.d("Navigating back to previous screen after deletion");
    context.showSnackBar("shared.notifications.auto_deleted");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.64);
    final style = Theme.of(context).textTheme.labelSmall?.copyWith(color: onSurface, letterSpacing: .2);

    return Padding(
      padding: padding,
      child: BlocConsumer<EntityMetaCubit<T>, EntityMetaState>(
        listener: (context, state) {
          state.whenOrNull(deleted: () => _onDeleted(context));
        },
        builder: (context, state) {
          return state.when(
            loading: () => const SizedBox.shrink(),
            created: () => const SizedBox.shrink(),
            error: (message, taskType) => _row(style, AppColors.entityError, _formatError(message)),
            deleted: () => _row(style, AppColors.entityError, 'entity.state.deleted'),
            upserted: (m) {
              final hasLabel = m.isPendingDelete || m.isPending;
              final label = m.isPendingDelete ? 'entity.state.deleting' : (m.isPending ? 'entity.state.pending' : '');
              final color = m.isPendingDelete || m.isPending ? AppColors.entityPending : AppColors.entityUpToDate;

              final parts = <Widget>[
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                ),
              ];

              if (hasLabel) {
                parts.addAll([const SizedBox(width: 6), Text(label, style: style)]);
              }

              void addTimestamp(IconData icon, Widget text) {
                if (parts.length > 1) {
                  parts.addAll([const SizedBox(width: 8), Text('•', style: style)]);
                }
                parts.addAll([const SizedBox(width: 8), Icon(icon, size: 14, color: onSurface), const SizedBox(width: 4), text]);
              }

              if (m.updatedAt != null) {
                addTimestamp(CommunityMaterialIcons.calendar_plus, Text(_relative(m.updatedAt!), style: style));
              }
              if (m.createdAt != null) {
                addTimestamp(CommunityMaterialIcons.calendar_edit, Text(DateFormat('dd.MM.yyyy').format(m.createdAt!.toLocal()), style: style));
              }
              return Row(children: parts);
            },
          );
        },
      ),
    );
  }

  String _formatError(String error) {
    final l = error.toLowerCase();
    if (l.contains('23505') || l.contains('unique constraint') || l.contains('duplicate key')) {
      return 'A item with this name already exists';
    }
    return error;
  }

  static Widget _row(TextStyle? style, Color dot, String label) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Flexible(child: Text(label.tr(), style: style)),
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
