import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../domain/entities/booking_draft.dart';

class CategorySelectInput extends StatelessWidget {
  final BookingDraft draft;

  const CategorySelectInput({required this.draft});

  _onCategoryTap(BuildContext context, Category category) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(category: category));
    Navigator.of(context).pop();
  }

  _reload(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).load();
  }

  void _openCategoryPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        final theme = Theme.of(context);
        return Material(
          color: theme.colorScheme.surface,
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // back/close button
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(sheetCtx).pop(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Select Category", // TODO translation
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: BlocBuilder<CategoryCubit, LoadableState<List<Category>>>(
                    builder: (ctx, state) {
                      return state.maybeWhen(
                        error: (message) => ErrorText(
                          message: message,
                          onReload: () {
                            _reload(context);
                          },
                        ),
                        loaded: (categories) => CategoryList(
                          categories: categories,
                          categoryType: draft.categoryType,
                          onCategoryTap: (category) => _onCategoryTap(context, category),
                          selectedCategory: draft.category,
                        ),
                        orElse: () => const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO translation
    final hasValue = draft.category != null;
    return ListTile(
      leading: hasValue
          ? Icon(IconConverter.getIcon(draft.category!.iconName), color: ColorConverter.stringToColor(draft.category!.iconColor))
          : Icon(CommunityMaterialIcons.table_large, color: Theme.of(context).hintColor),
      title: Text(
        hasValue ? draft.category!.name : "Category",
        style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor),
      ),
      subtitle: hasValue ? Text("Category") : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      onTap: () => _openCategoryPicker(context),
      // onTap: onTap,
    );
  }
}
