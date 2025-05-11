import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../application/cubits/booking_save_cubit.dart';
import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/suggestion_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import '../screens/booking_save_tab1.dart';
import '../screens/booking_save_tab2.dart';
import '../widgets/amount_display.dart';

class BookingSavePage extends StatefulWidget {
  final Booking? model;

  const BookingSavePage({super.key, required this.model});

  @override
  State<BookingSavePage> createState() => _BookingSavePageState();
}

class _BookingSavePageState extends State<BookingSavePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<AmountDisplayState> _amountDisplayKey = GlobalKey<AmountDisplayState>();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble());
    BlocProvider.of<BookingSaveCubit>(context).init(widget.model);
    BlocProvider.of<SuggestionCubit>(context).load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _openCategories(BookingDraft draft) {
    if (draft.amount.toDouble() > 0) {
      _animateToPage(1);
    } else {
      _showAmountError();
    }
  }

  _showAmountError() {
    Haptics.vibrate(HapticsType.error);
    _amountDisplayKey.currentState?.triggerShakeAnimation();
  }

  _animateToPage(int page) {
    setState(() {
      _currentPage = page;
    });

    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  _onSave(BookingDraft draft) {
    if (draft.amount.toDouble() <= 0) {
      _showAmountError();
      return;
    }
    if (draft.category == null) {
      if (_currentPage == 0) {
        _animateToPage(1);
      } else {
        context.showErrorSnackBar("booking.validation.required_category", duration: Duration(seconds: 2));
      }
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

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _currentPage == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _animateToPage(0);
        }
      },
      child: _buildPage(),
    );
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
    return SafeArea(
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          BookingSaveTab1(
            draft: draft,
            onCategoryTap: () => _openCategories(draft),
            amountDisplayKey: _amountDisplayKey,
          ),
          BookingSaveTab2(draft: draft),
        ],
      ),
    );
  }
}
