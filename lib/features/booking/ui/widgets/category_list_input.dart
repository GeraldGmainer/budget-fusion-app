import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/booking/application/cubits/booking_save_cubit.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking_draft.dart';

class CategoryListInput extends StatelessWidget {
  final BookingDraft draft;

  const CategoryListInput({required this.draft});

  _onCategoryTap(BuildContext context, Category category) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(category: category));
  }

  _reload(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, LoadableState<List<Category>>>(
      builder: (context, state) {
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
    );
  }
}
