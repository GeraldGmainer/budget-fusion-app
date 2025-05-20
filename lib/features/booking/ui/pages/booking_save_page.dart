import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/suggestion_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import '../widgets/account_select_input.dart';
import '../widgets/amount_display.dart';
import '../widgets/calculator_sheet.dart';
import '../widgets/category_select_input.dart';
import '../widgets/date_input.dart';
import '../widgets/description_input.dart';
import '../widgets/transaction_type_input.dart';

class BookingSavePage extends StatefulWidget {
  final Booking? model;

  const BookingSavePage({super.key, required this.model});

  @override
  State<BookingSavePage> createState() => _BookingSavePageState();
}

class _BookingSavePageState extends State<BookingSavePage> {
  final GlobalKey<AmountDisplayState> _amountDisplayKey = GlobalKey<AmountDisplayState>();
  bool _isCalculatorOpen = false;
  bool _categoryError = false;

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
    setState(() => _isCalculatorOpen = true);
    final bookingCubit = context.read<BookingSaveCubit>();
    final calculatorCubit = context.read<CalculatorCubit>();

    showModalBottomSheet(
      context: context,
      showDragHandle: false,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      builder: (_) => CalculatorSheet(bookingSaveCubit: bookingCubit, calculatorCubit: calculatorCubit),
    ).whenComplete(() {
      setState(() => _isCalculatorOpen = false);
    });
  }

  Future<void> _showPasteMenuAt(Offset tapPosition) async {
    PasteHelper.showPasteMenuAt<double>(
      context: context,
      position: tapPosition,
      parser: (input) => double.tryParse(input),
      onValid: (value) {
        context.read<CalculatorCubit>().init(value);
        context.read<BookingSaveCubit>().updateDraft((d) => d.copyWith(amount: Decimal.parse(value.toString())));
      },
      onInvalid: _showAmountError,
    );
  }

  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim() ?? '';
    final value = double.tryParse(text);
    if (!mounted) return;

    if (value != null) {
      context.read<CalculatorCubit>().init(value);
      context.read<BookingSaveCubit>().updateDraft((d) => d.copyWith(amount: Decimal.parse(value.toString())));
    } else {
      _showAmountError();
    }
  }

  _onCategoryTypeChange(CategoryType value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value, category: null));
  }

  _onDateChange(DateTime value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: value));
  }

  _onAccountChange(Account value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(account: value));
  }

  _onCategoryChange(Category category) {
    setState(() => _categoryError = true);
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(category: category));
  }

  _onDescriptionChange(String? value) {
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(description: value));
  }

  _showAmountError() {
    Haptics.vibrate(HapticsType.error);
    _amountDisplayKey.currentState?.triggerShakeAnimation();
  }

  _onSave(BookingDraft draft) {
    bool isValid = true;
    if (draft.amount.toDouble() <= 0) {
      isValid = false;
      _showAmountError();
    }
    if (draft.category == null) {
      isValid = false;
      setState(() => _categoryError = true);
    }
    if (!isValid) {
      return;
    }
    context.read<BookingSaveCubit>().save();
  }

  _onSaveSuccess(BookingDraft draft) {
    context.showSnackBar(draft.isCreating ? "booking.notifications.success.create" : "booking.notifications.success.edit");
    Navigator.of(context).pop();
  }

  _onError(AppError error) {
    context.showErrorSnackBar(error);
  }

  _onDelete() {
    ConfirmDialog.show(
      context,
      headerText: "booking.dialogs.delete.title",
      bodyText: "booking.dialog.delete.body",
      onOK: () {
        BlocProvider.of<BookingSaveCubit>(context).delete(widget.model);
      },
    );
  }

  _onDeleteSuccess(Booking booking) {
    context.showSnackBar("booking.notifications.delete.success");
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
            title: Text(state.draft.isCreating ? "booking.newTitle" : "booking.editTitle").tr(),
            actions: [if (!state.draft.isCreating) FormActionMenu(onDelete: _onDelete)],
          ),
          floatingActionButton: AppFab.save(() => _onSave(state.draft)),
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: TransactionTypeInput(draft: draft, onChange: _onCategoryTypeChange)),
          SizedBox(height: AppDimensions.verticalPadding),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: InkWell(
              onTap: _openCalculator,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onLongPressStart: (details) {
                  _showPasteMenuAt(details.globalPosition);
                },
                child: AmountDisplay(key: _amountDisplayKey, isCalculatorOpen: _isCalculatorOpen),
              ),
            ),
          ),
          SizedBox(height: AppDimensions.verticalPadding),
          Card(
            child: Column(
              children: [
                DateInput(draft: draft, onChange: _onDateChange),
                _buildDivider(),
                AccountSelectInput(draft: draft, onChange: _onAccountChange),
                _buildDivider(),
                CategorySelectInput(draft: draft, onChange: _onCategoryChange, hasError: _categoryError),
                _buildDivider(),
                DescriptionInput(draft: draft, onChanged: _onDescriptionChange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Divider(color: AppColors.disabledTextColor));
  }
}
