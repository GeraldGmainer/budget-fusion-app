import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../application/cubits/suggestion_cubit.dart';
import '../../data/dtos/booking_suggestion_dto.dart';
import '../../domain/entities/booking_draft.dart';

class DescriptionInput extends StatelessWidget {
  final BookingDraft draft;
  final Function(String? value) onChanged;

  const DescriptionInput({required this.draft, required this.onChanged});

  void _openDescriptionModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheetCtx) {
        return DescriptionInputModal(draft: draft, onChanged: onChanged);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = draft.description != null;
    return ListTile(
      leading: Icon(CommunityMaterialIcons.book_edit, color: Colors.grey[400]),
      title: Text(hasValue ? draft.description! : "booking.fields.description".tr(), style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor)),
      subtitle: hasValue ? Text("booking.fields.description".tr()) : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      onTap: () => _openDescriptionModal(context),
    );
  }
}

class DescriptionInputModal extends StatefulWidget {
  final BookingDraft draft;
  final Function(String? value) onChanged;

  const DescriptionInputModal({super.key, required this.draft, required this.onChanged});

  @override
  State<DescriptionInputModal> createState() => _DescriptionInputModalState();
}

class _DescriptionInputModalState extends State<DescriptionInputModal> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.draft.description);
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  _onSelect(String value) {
    _finish(value);
  }

  _onSave() {
    _finish(_controller.text);
  }

  _finish(String? value) {
    widget.onChanged.call(value.isNullOrEmpty ? null : value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("booking.dialogs.description.title".tr()),
        leading: IconButton(icon: Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
      ),
      floatingActionButton: AppFab.save(_onSave),
      body: Column(
        children: [
          BlocBuilder<SuggestionCubit, LoadableState>(
            builder: (context, state) {
              final List<BookingSuggestionDto> suggestions = state.maybeWhen(loaded: (suggestions) => suggestions, orElse: () => []);
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildInput(suggestions.where((x) => x.categoryType == widget.draft.categoryType).map((x) => x.suggestion).toList()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInput(List<String> suggestions) {
    return TypeAheadField<String>(
      controller: _controller,
      debounceDuration: Duration.zero,
      hideOnEmpty: true,
      suggestionsCallback: (pattern) async {
        if (pattern.isNullOrEmpty) {
          return [];
        }
        final allMatches = suggestions.where((s) => s.toLowerCase().contains(pattern.toLowerCase())).toList();
        if (allMatches.length > 50) {
          return allMatches.sublist(0, 50);
        }
        return allMatches;
      },
      decorationBuilder: (context, child) {
        return Material(
          elevation: 6,
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.cardColor), child: child),
        );
      },
      itemBuilder: (context, suggestion) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(suggestion, style: TextStyle(fontSize: 13, color: AppColors.primaryTextColor, fontWeight: FontWeight.w400)),
        );
      },
      onSelected: (suggestion) => _onSelect(suggestion),
      builder: (context, controller, focusNode) {
        // TODO translation
        return TextField(
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _onSave(),
          style: TextStyle(fontSize: 13),
          autofocus: true,
          maxLength: FeatureConstants.descriptionMaxLength,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.edit, size: 22),
            labelText: "booking.fields.description".tr(),
            labelStyle: TextStyle(fontSize: 14),
            counterText: "",
          ),
        );
      },
    );
  }
}
