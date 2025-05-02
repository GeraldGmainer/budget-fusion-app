import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/category_save_cubit.dart';
import '../../domain/entities/category_draft.dart';

class CategorySaveContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool submitted;
  final Category? model;
  final Widget Function(BuildContext context, CategoryDraft draft) builder;

  const CategorySaveContainer({
    super.key,
    required this.builder,
    required this.formKey,
    required this.submitted,
    required this.model,
  });

  _onUploadSuccess(BuildContext context, CategoryDraft draft) {
    showSnackBar(context, draft.isCreating ? "category.create_success" : "category.edit_success");
    Navigator.of(context).pop();
  }

  _onDelete(BuildContext context) {
    ConfirmDialog.show(context,
        headerText: "booking.dialog.delete_title",
        bodyText: "booking.dialog.delete_body",
        onOK: () => BlocProvider.of<CategorySaveCubit>(context).delete(model));
  }

  _onDeleteSuccess(BuildContext context, Category model) {
    showSnackBar(context, "booking.delete_success");
    Navigator.of(context).pop();
  }

  _onError(BuildContext context, String error) {
    showSnackBar(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategorySaveCubit, CategorySaveState>(
      listener: (context, state) {
        state.whenOrNull(
          loaded: (draft) => _onUploadSuccess(context, draft),
          deleted: (_, model) => _onDeleteSuccess(context, model),
          error: (draft, error) => _onError(context, error),
        );
      },
      builder: (context, state) {
        return UnsavedChangesGuard(
          hasChange: state.draft != state.initialDraft,
          child: Form(
            key: formKey,
            autovalidateMode: submitted ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
            child: Scaffold(
              appBar: AppBar(
                title: Text(state.draft.isCreating ? "category.new_title" : "category.edit_title").tr(),
                actions: [
                  if (!state.draft.isCreating)
                    IconButton(
                      icon: const Icon(CommunityMaterialIcons.delete),
                      onPressed: () => _onDelete(context),
                    )
                ],
              ),
              body: state.maybeWhen(
                draftUpdate: (draft, _) => builder(context, draft),
                error: (draft, __) => builder(context, draft),
                orElse: () => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}
