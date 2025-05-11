import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/suggestion_cubit.dart';
import '../../data/dtos/booking_suggestion_dto.dart';
import '../../domain/entities/booking_draft.dart';

class DescriptionInput extends StatefulWidget {
  final BookingDraft draft;

  const DescriptionInput({required this.draft});

  @override
  State<DescriptionInput> createState() => _DescriptionInputState();
}

class _DescriptionInputState extends State<DescriptionInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.draft.description);
  }

  _onChanged(String value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(description: value));
  }

  _onSelect(String value) {
    _controller.text = value;
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(description: value));
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionCubit, LoadableState>(
      builder: (context, state) {
        final List<BookingSuggestionDto> suggestions = state.maybeWhen(loaded: (suggestions) => suggestions, orElse: () => []);
        return _buildInput(suggestions.where((x) => x.categoryType == widget.draft.categoryType).map((x) => x.suggestion).toList());
      },
    );
  }

  Widget _buildInput(List<String> suggestions) {
    return TypeAheadField<String>(
      controller: _controller,
      debounceDuration: Duration.zero,
      hideOnEmpty: true,
      suggestionsCallback: (pattern) async {
        return suggestions.where((s) => s.toLowerCase().contains(pattern.toLowerCase())).toList();
      },
      decorationBuilder: (context, child) {
        return Material(
          elevation: 6,
          child: Container(
            // constraints: const BoxConstraints(maxHeight: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.cardColor,
            ),
            child: child,
          ),
        );
      },
      itemBuilder: (context, suggestion) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(
            suggestion,
            style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor, fontWeight: FontWeight.w400),
          ),
        );
      },
      onSelected: (suggestion) {
        _onSelect(suggestion);
      },
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: _onChanged,
          style: TextStyle(fontSize: 13),
          maxLength: FeatureConstants.descriptionMaxLength,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.edit, size: 22),
            labelText: "booking.note".tr(),
            labelStyle: TextStyle(fontSize: 14),
            counterText: "",
          ),
        );
      },
    );
  }
}
