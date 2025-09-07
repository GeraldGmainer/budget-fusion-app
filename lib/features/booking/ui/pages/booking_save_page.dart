import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/features/budget_book/budget_book.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../../repos/account/account.dart';
import '../../../../repos/booking/booking.dart';
import '../../../../repos/category/category.dart';
import '../../bloc/booking_save_cubit.dart';
import '../../bloc/calculator_cubit.dart';
import '../../bloc/suggestion_cubit.dart';
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
    final state = context.read<BudgetBookCubit>().state;
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble());
    BlocProvider.of<BookingSaveCubit>(context).init(widget.model, state.dateRange, state.period);
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

  void _onCategoryTypeChange(CategoryType value) => context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(categoryType: value, category: null));

  void _onDateChange(DateTime value) => context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(date: value));

  void _onAccountChange(Account value) => context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(account: value));

  void _onDescriptionChange(String? value) => context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(description: value));

  void _onCategoryChange(Category category) {
    setState(() => _categoryError = true);
    context.read<BookingSaveCubit>().updateDraft((draft) => draft.copyWith(category: category));
  }

  void _showAmountError() {
    Haptics.vibrate(HapticsType.error);
    _amountDisplayKey.currentState?.triggerShakeAnimation();
  }

  void _onSave(BookingDraft draft) {
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

  void _onSaveSuccess(BookingDraft draft) {
    context.showSnackBar(draft.isCreating ? "booking.notifications.success.create" : "booking.notifications.success.edit");
    Navigator.of(context).pop();
  }

  void _onError(AppError error) => context.showErrorSnackBar(error);

  void _onDelete() {
    ConfirmDialog.show(
      context,
      headerText: "booking.dialogs.delete.title",
      bodyText: "booking.dialogs.delete.body",
      onOK: () => BlocProvider.of<BookingSaveCubit>(context).delete(widget.model!),
    );
  }

  void _onDeleteSuccess(Booking booking) {
    context.showSnackBar("booking.notifications.success.delete");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingSaveCubit, BookingSaveState>(
      buildWhen: (previous, current) => previous.draft != current.draft,
      listener: (context, state) {
        state.whenOrNull(loaded: (draft) => _onSaveSuccess(draft), deleted: (_, booking) => _onDeleteSuccess(booking), error: (draft, error) => _onError(error));
      },
      builder: (context, state) {
        return UnsavedChangesGuard(
          hasChange: state.draft != state.initialDraft,
          child: Scaffold(
            appBar: AppBar(
              title: Text(state.draft.isCreating ? "booking.newTitle" : "booking.editTitle").tr(),
              actions: [if (!state.draft.isCreating) FormActionMenu(onDelete: _onDelete)],
            ),
            floatingActionButton: AppFab.save(() => _onSave(state.draft)),
            resizeToAvoidBottomInset: false,
            body: state.maybeWhen(
              draftUpdate: (draft, _) => _buildContent(draft),
              error: (draft, _) => _buildContent(draft),
              orElse: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BookingDraft draft) {
    return FormScroll(
      padding: AppDimensions.pageCardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: TransactionTypeInput(draft: draft, onChange: _onCategoryTypeChange),
          ),
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
                if (widget.model != null) _buildDivider(),
                if (widget.model != null) EntityMetaWidget<Booking>(id: widget.model!.id, repo: getIt<BookingRepo>(), padding: const EdgeInsets.fromLTRB(16, 4, 16, 8)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Divider(color: AppColors.disabledTextColor),
  );
}
