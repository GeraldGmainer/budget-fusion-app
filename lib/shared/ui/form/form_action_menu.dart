import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class FormActionMenu extends StatelessWidget {
  final VoidCallback? onDelete;
  final List<PopupMenuEntry<void>> Function(BuildContext context)? actions;

  const FormActionMenu({super.key, this.onDelete, this.actions});

  @override
  Widget build(BuildContext context) {
    final items = <PopupMenuEntry<void>>[];

    if (actions != null) {
      items.addAll(actions!(context));
    }

    if (onDelete != null) {
      items.add(
        PopupMenuItem<void>(
          value: null,
          // TODO translation
          child: Text('Delete'),
          onTap: () {
            onDelete!();
          },
        ),
      );
    }

    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton<void>(
      icon: const Icon(CommunityMaterialIcons.dots_vertical),
      itemBuilder: (_) => items,
    );
  }
}
