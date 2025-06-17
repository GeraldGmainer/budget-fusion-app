import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UnsavedChangesGuard extends StatelessWidget {
  final bool hasChange;
  final Widget child;
  final String titleKey;
  final String messageKey;

  const UnsavedChangesGuard({
    super.key,
    required this.hasChange,
    required this.child,
    this.titleKey = 'shared.dialog.unsaved_changes.title',
    this.messageKey = 'shared.dialog.unsaved_changes.body',
  });

  Future<bool> _confirmDiscard(BuildContext ctx) async {
    final result = await showDialog<bool>(
      context: ctx,
      builder:
          (_) => AlertDialog(
            title: Text(titleKey).tr(),
            content: Text(messageKey).tr(),
            actions: [
              TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text('shared.button.cancel').tr()),
              TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text('shared.button.ok').tr()),
            ],
          ),
    );
    return result == true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !hasChange,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldLeave = await _confirmDiscard(context);
        if (shouldLeave && context.mounted) Navigator.of(context).pop();
      },
      child: child,
    );
  }
}
