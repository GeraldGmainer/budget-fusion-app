import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class SaveAction extends StatelessWidget {
  final VoidCallback onSave;

  const SaveAction({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onSave,
      icon: Icon(CommunityMaterialIcons.check),
    );
  }
}
