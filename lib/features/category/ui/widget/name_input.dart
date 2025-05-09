import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameInput extends StatelessWidget {
  final CategoryDraft draft;
  final bool autofocus;

  const NameInput({super.key, required this.draft, required this.autofocus});

  void _onNameChange(BuildContext context, String value) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(name: value));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: draft.name,
      autofocus: autofocus,
      style: TextStyle(fontSize: 13),
      maxLength: FeatureConstants.descriptionMaxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value.isNullOrEmpty ? 'category.validation.required_name'.tr() : null,
      decoration: InputDecoration(
        labelText: 'Name'.tr(),
        labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
        counterText: "",
      ),
      onChanged: (value) => _onNameChange(context, value),
    );
  }
}
