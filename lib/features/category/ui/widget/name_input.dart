import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_draft.dart';

class NameInput extends StatelessWidget {
  final CategoryDraft draft;
  final Function(String name) onNameChange;

  const NameInput({super.key, required this.draft, required this.onNameChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: draft.name,
      style: TextStyle(fontSize: 13),
      maxLength: FeatureConstants.descriptionMaxLength,
      decoration: InputDecoration(
        labelText: 'Name'.tr(),
        labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
        counterText: "",
      ),
      onChanged: (value) => onNameChange(value),
    );
  }
}
