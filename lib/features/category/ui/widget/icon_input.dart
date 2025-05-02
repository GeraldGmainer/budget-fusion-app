import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/category/category.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/category_draft.dart';
import 'icon_color_picker_dialog.dart';

class IconInput extends StatelessWidget {
  final CategoryDraft draft;

  const IconInput({super.key, required this.draft});

  _onIconTap(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, String>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => FractionallySizedBox(
        heightFactor: 1.0,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: IconColorPickerDialog(
            initialIconName: draft.iconName,
            initialIconColor: draft.iconColor,
          ),
        ),
      ),
    );
    if (result != null && context.mounted) {
      context.read<CategorySaveCubit>().updateDraft((draft) => draft.copyWith(iconName: result['iconName']!, iconColor: result['iconColor']!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onIconTap(context),
      child: SizedBox(
        width: 80,
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBudgetIcon(),
            _buildEditIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetIcon() {
    return Positioned.fill(
      child: Material(
        type: MaterialType.circle,
        elevation: 4,
        shadowColor: Colors.black45,
        color: AppColors.cardColor,
        child: Center(
          child: BudgetIcon(
            name: draft.iconName,
            color: draft.iconColor,
            size: 44,
          ),
        ),
      ),
    );
  }

  Widget _buildEditIcon() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.accentColor,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 4),
          ],
        ),
        child: Icon(
          Icons.edit,
          size: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
