import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repos/category/category.dart';

class NameInput extends StatelessWidget {
  final CategoryDraft draft;
  final bool autofocus;

  const NameInput({super.key, required this.draft, required this.autofocus});

  void _onNameChange(BuildContext context, String value) {
    context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(name: value));
  }

  @override
  Widget build(BuildContext context) {
    final categories = context.select<RepoCubit<Category>, List<Category>?>(
      (cubit) => cubit.state.maybeWhen(loaded: (data) => data, orElse: () => null),
    );

    return TextFormField(
      initialValue: draft.name,
      autofocus: autofocus,
      style: TextStyle(fontSize: 13),
      maxLength: FeatureConstants.descriptionMaxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => _validate(value, categories),
      decoration: InputDecoration(
        labelText: 'category.fields.name'.tr(),
        labelStyle: TextStyle(fontSize: 12, color: AppColors.secondaryTextColor),
        counterText: "",
      ),
      onChanged: (value) => _onNameChange(context, value),
    );
  }

  String? _validate(String? value, List<Category>? categories) {
    if (value.isNullOrEmpty) {
      return 'shared.validation.required'.tr();
    }

    if (categories != null) {
      final exists = categories.any((c) => c.name.toLowerCase() == value!.trim().toLowerCase() && c.id != draft.id);
      if (exists) {
        return 'shared.validation.duplicate'.tr();
      }
    }
    return null;
  }
}
