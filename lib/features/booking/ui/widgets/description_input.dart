import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../application/cubits/save_booking_cubit.dart';
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
    context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(description: value));
  }

  _onSelect(String value) {
    _controller.text = value;
    context.read<SaveBookingCubit>().updateDraft((draft) => draft.copyWith(description: value));
  }

  @override
  Widget build(BuildContext context) {
    // TODO suggestions
    // return BlocBuilder<SuggestionBloc, SuggestionState>(
    //   builder: (context, state) {
    //     if (state is SuggestionLoadedState) {
    //       return _buildInput(state.suggestions);
    //     }
    //     return _buildInput([]);
    //   },
    // );
    return _buildInput([]);
  }

  // Widget _buildInput(List<String> suggestions) {
  //   return TypeAheadField<String>(
  //     debounceDuration: const Duration(milliseconds: 0),
  //     minCharsForSuggestions: 1,
  //     hideOnEmpty: true,
  //     textFieldConfiguration: TextFieldConfiguration(
  //       _controller: _controller,
  //       onChanged: _onChanged,
  //       maxLength: 20,
  //       decoration: InputDecoration(
  //         prefixIcon: Icon(Icons.edit),
  //         labelText: "booking.note".tr(),
  //       ),
  //     ),
  //     suggestionsCallback: (pattern) async {
  //       return suggestions.where((suggestion) => suggestion.toLowerCase().contains(pattern.toLowerCase()));
  //     },
  //     itemBuilder: (context, suggestion) {
  //       return ListTile(
  //         title: Text(suggestion),
  //       );
  //     },
  //     transitionBuilder: (context, suggestionsBox, controller) {
  //       return suggestionsBox;
  //     },
  //     onSuggestionSelected: (String suggestion) {
  //       _onSelect(suggestion);
  //     },
  //   );
  // }

  Widget _buildInput(List<String> suggestions) {
    return TypeAheadField<String>(
      controller: _controller,
      debounceDuration: Duration.zero,
      suggestionsCallback: (pattern) async {
        return suggestions.where((s) => s.toLowerCase().contains(pattern.toLowerCase())).toList();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(title: Text(suggestion));
      },
      onSelected: (suggestion) {
        _onSelect(suggestion);
      },
      builder: (context, controller, focusNode) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: _onChanged,
            maxLength: 20,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.edit),
              labelText: "booking.note".tr(),
            ),
          ),
        );
      },
    );
  }
}
