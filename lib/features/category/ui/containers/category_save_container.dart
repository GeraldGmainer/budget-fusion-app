import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/category_save_cubit.dart';
import '../../domain/entities/category_draft.dart';

class CategorySaveContainer extends StatefulWidget {
  final CategoryDraft draft;
  final AppBar appBar;
  final Widget Function(BuildContext context, CategoryDraft draft) builder;

  const CategorySaveContainer({
    super.key,
    required this.draft,
    required this.builder,
    required this.appBar,
  });

  @override
  State<CategorySaveContainer> createState() => _CategorySaveContainerState();
}

class _CategorySaveContainerState extends State<CategorySaveContainer> {
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategorySaveCubit>(context).init(widget.draft);
  }

  _onSave() {
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    context.read<CategorySaveCubit>().save();
  }

  _onSavedSuccess(CategoryDraft draft) {
    showSnackBar(context, draft.isCreating ? "category.create_success" : "category.edit_success");
    Navigator.of(context).pop(true);
  }

  _onDeleteSuccess() {
    showSnackBar(context, "booking.delete_success");
    Navigator.of(context).pop(true);
  }

  _onError(String error) {
    showSnackBar(context, error);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategorySaveCubit, CategorySaveState>(
      listener: (context, state) {
        state.whenOrNull(
          saved: _onSavedSuccess,
          deleted: (_) => _onDeleteSuccess(),
          error: (_, error) => _onError(error),
        );
      },
      builder: (context, state) {
        return UnsavedChangesGuard(
          hasChange: state.draft != state.initialDraft,
          child: Form(
            key: _formKey,
            autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
            child: Scaffold(
              appBar: widget.appBar,
              body: state.maybeWhen(
                draftUpdate: (draft, _) => _buildBody(draft),
                error: (draft, __) => _buildBody(draft),
                orElse: () => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(CategoryDraft draft) {
    return Padding(
      padding: AppDimensions.pageCardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: widget.builder(context, draft)),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _onSave, child: Text('Save'.tr())),
        ],
      ),
    );
  }
}
