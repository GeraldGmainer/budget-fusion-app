import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/suggestion_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import '../widgets/amount_display.dart';

class BookingSavePage extends StatefulWidget {
  final Booking? model;

  const BookingSavePage({super.key, required this.model});

  @override
  State<BookingSavePage> createState() => _BookingSavePageState();
}

class _BookingSavePageState extends State<BookingSavePage> {
  final GlobalKey<AmountDisplayState> _amountDisplayKey = GlobalKey<AmountDisplayState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble());
    BlocProvider.of<BookingSaveCubit>(context).init(widget.model);
    BlocProvider.of<SuggestionCubit>(context).load();
  }

  _showAmountError() {
    Haptics.vibrate(HapticsType.error);
    _amountDisplayKey.currentState?.triggerShakeAnimation();
  }

  _onSave(BookingDraft draft) {
    if (draft.amount.toDouble() <= 0) {
      _showAmountError();
      return;
    }
    if (draft.category == null) {
      context.showErrorSnackBar("booking.validation.required_category", duration: Duration(seconds: 2));
      return;
    }
    context.read<BookingSaveCubit>().save();
  }

  _onSaveSuccess(BookingDraft draft) {
    context.showSnackBar(draft.isCreating ? "booking.create_success" : "booking.edit_success");
    Navigator.of(context).pop();
  }

  _onError(String error) {
    context.showSnackBar(error);
  }

  _onDelete() {
    ConfirmDialog.show(
      context,
      headerText: "booking.dialog.delete_title",
      bodyText: "booking.dialog.delete_body",
      onOK: () {
        BlocProvider.of<BookingSaveCubit>(context).delete(widget.model);
      },
    );
  }

  _onDeleteSuccess(Booking booking) {
    context.showSnackBar("booking.delete_success");
    Navigator.of(context).pop();
  }

  // TODO show unsaved change dialog
  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return BlocConsumer<BookingSaveCubit, BookingSaveState>(
      buildWhen: (previous, current) {
        return previous.draft != current.draft;
      },
      listener: (context, state) {
        state.whenOrNull(
          loaded: (draft) => _onSaveSuccess(draft),
          deleted: (_, booking) => _onDeleteSuccess(booking),
          error: (draft, error) => _onError(error),
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.draft.isCreating ? "booking.new_title" : "booking.edit_title").tr(),
            actions: [
              SaveAction(onSave: () => _onSave(state.draft)),
              if (!state.draft.isCreating) FormActionMenu(onDelete: _onDelete),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: state.maybeWhen(
            draftUpdate: (draft) => _buildContent(draft),
            error: (draft, __) => _buildContent(draft),
            orElse: () => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget _buildContent(BookingDraft draft) {
    return Padding(
      padding: AppDimensions.pageFloatingPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AmountDisplay(key: _amountDisplayKey),
          SizedBox(height: AppDimensions.verticalPadding),
          CategoryTypeSelector(
            selected: CategoryType.outcome,
            onChanged: (CategoryType value) {},
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("26. Mai 2025"),
            subtitle: Text("Date"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.add_circle_outline),
                SizedBox(width: 8.0),
                Icon(Icons.remove_circle_outline),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          _buildListTile<CategoryType>(
            icon: CommunityMaterialIcons.swap_horizontal,
            label: "Category Type",
            value: draft.categoryType,
            display: (type) => type.name,
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          _buildListTile<Account>(
            icon: CommunityMaterialIcons.bank,
            label: "Account",
            value: draft.account,
            display: (acct) => acct.name,
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          _buildListTile<Category>(
            icon: CommunityMaterialIcons.table_large,
            label: "Category",
            value: draft.category,
            display: (cat) => cat.name,
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          DescriptionField(initialValue: null, onChanged: (value) {}),
        ],
      ),
    );
  }

  Widget _buildListTile<T>({
    required IconData icon,
    required String label,
    T? value,
    required String Function(T) display,
    // required VoidCallback onTap,
  }) {
    final hasValue = value != null;
    return ListTile(
      leading: Icon(icon, color: Colors.grey[400]),
      title: Text(
        hasValue ? display(value as T) : label, // show the label as a placeholder
        style: hasValue ? null : TextStyle(color: Theme.of(context).hintColor),
      ),
      subtitle: hasValue
          ? Text(label) // only once you’ve picked something
          : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      // onTap: onTap,
    );
  }
}

class DescriptionField extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const DescriptionField({
    Key? key,
    this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DescriptionFieldState createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  static const _maxChars = 20;
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = _controller.text.length;
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom: BorderSide(color: Theme.of(context).dividerColor),
      //   ),
      // ),
      child: Row(
        children: [
          Icon(CommunityMaterialIcons.pencil_outline, color: Colors.grey[400]),
          SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: _controller,
              maxLength: _maxChars,
              decoration: InputDecoration(
                counterText: '',
                hintText: "Description",
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.white),
              onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryTypeSelector extends StatelessWidget {
  final CategoryType selected;
  final ValueChanged<CategoryType> onChanged;

  const CategoryTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext ctx) {
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(CommunityMaterialIcons.swap_horizontal, color: Colors.grey[400]),
          SizedBox(width: 16),
          Expanded(
            child: Wrap(
              spacing: 8,
              children: CategoryType.values.map((type) {
                final isSelected = type == selected;
                return ChoiceChip(
                  label: Text(type.name.tr()),
                  selected: isSelected,
                  onSelected: (_) => onChanged(type),
                  selectedColor: Theme.of(ctx).colorScheme.primary,
                  // labelStyle: TextStyle(
                  //   color: isSelected
                  //       ? Colors.white
                  //       : Theme.of(ctx).textTheme.bodyText1!.color,
                  // ),
                  backgroundColor: Theme.of(ctx).cardColor,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
