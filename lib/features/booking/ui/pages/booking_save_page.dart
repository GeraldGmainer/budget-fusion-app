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
import '../calculator/calculator.dart';
import '../widgets/account_select_input.dart';
import '../widgets/amount_display.dart';
import '../widgets/category_select_input.dart';
import '../widgets/date_input.dart';
import '../widgets/transaction_type_input.dart';

class BookingSavePage extends StatefulWidget {
  final Booking? model;

  const BookingSavePage({super.key, required this.model});

  @override
  State<BookingSavePage> createState() => _BookingSavePageState();
}

class _BookingSavePageState extends State<BookingSavePage> {
  bool _isCalculatorOpen = false;
  final GlobalKey<AmountDisplayState> _amountDisplayKey = GlobalKey<AmountDisplayState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble());
    BlocProvider.of<BookingSaveCubit>(context).init(widget.model);
    BlocProvider.of<SuggestionCubit>(context).load();

    if (widget.model == null) {
      Future.delayed(Duration(milliseconds: 300), _openCalculator);
    }
  }

  void _openCalculator() {
    setState(() {
      _isCalculatorOpen = true;
    });
    final bookingCubit = context.read<BookingSaveCubit>();
    final calculatorCubit = context.read<CalculatorCubit>();

    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      builder: (_) => Material(
        // TODO save to AppColors
        color: Color(0xFF282828),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 32.0),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Theme.of(context).dividerColor, borderRadius: BorderRadius.circular(2)),
            ),
            SizedBox(height: 32.0),
            Calculator(bookingSaveCubit: bookingCubit, calculatorCubit: calculatorCubit),
          ],
        ),
      ),
    ).whenComplete(() {
      setState(() {
        _isCalculatorOpen = false;
      });
    });
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
              if (!state.draft.isCreating) FormActionMenu(onDelete: _onDelete),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _onSave(state.draft),
            child: Icon(Icons.check),
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
      padding: AppDimensions.pageCardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: TransactionTypeInput(draft: draft),
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: _openCalculator,
              child: AmountDisplay(key: _amountDisplayKey, isCalculatorOpen: _isCalculatorOpen),
            ),
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          Card(
            child: Column(
              children: [
                DateInput(draft: draft),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Divider(color: AppColors.disabledTextColor)),
                AccountSelectInput(draft: draft),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Divider(color: AppColors.disabledTextColor)),
                CategorySelectInput(draft: draft),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Divider(color: AppColors.disabledTextColor)),
                // SizedBox(height: AppDimensions.verticalPadding),
                _buildListTile<String>(
                  icon: CommunityMaterialIcons.book_edit,
                  label: "Description",
                  value: draft.description,
                  display: (value) => value,
                ),
              ],
            ),
          ),
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
      subtitle: hasValue ? Text(label) : null,
      trailing: Icon(CommunityMaterialIcons.chevron_right),
      // onTap: onTap,
    );
  }
}
