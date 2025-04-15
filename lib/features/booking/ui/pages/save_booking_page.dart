import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/save_booking_cubit.dart';
import '../../application/cubits/suggestion_cubit.dart';
import '../../domain/entities/booking_draft.dart';
import '../screens/save_booking_tab1.dart';
import '../screens/save_booking_tab2.dart';
import '../widgets/amount_display.dart';
import '../widgets/category_type_button.dart';

class SaveBookingPage extends StatefulWidget {
  final Booking? model;

  const SaveBookingPage({super.key, required this.model});

  @override
  State<SaveBookingPage> createState() => _SaveBookingPageState();
}

class _SaveBookingPageState extends State<SaveBookingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<AmountDisplayState> _amountDisplayKey = GlobalKey<AmountDisplayState>();
  int _currentPage = 0;
  late SaveBookingCubit _saveBookingCubit;
  late Future _cubitInitialized;

  @override
  void initState() {
    super.initState();
    _saveBookingCubit = BlocProvider.of<SaveBookingCubit>(context);
    _cubitInitialized = context.read<SaveBookingCubit>().stream.firstWhere((state) => state.maybeWhen(draftUpdate: (_) => true, orElse: () => false));
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble() ?? 0);
    _saveBookingCubit.init(widget.model);
    BlocProvider.of<SuggestionCubit>(context).load();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _saveBookingCubit.dispose();
    super.dispose();
  }

  _openCategories(BookingDraft draft) {
    if (draft.amount.toDouble() > 0) {
      _animateToPage(1);
    } else {
      Haptics.vibrate(HapticsType.error);
      _amountDisplayKey.currentState?.triggerShakeAnimation();
    }
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

  _onUploadSuccess(BookingDraft draft) {
    showSnackBar(context, draft.isCreating ? "booking.create_success" : "booking.edit_success");
    Navigator.of(context).pop();
  }

  _onError(String error) {
    showSnackBar(context, error);
  }

  _onDelete() {
    ConfirmDialog.show(
      context,
      headerText: "booking.dialog.delete_title",
      bodyText: "booking.dialog.delete_body",
      onOK: () {
        BlocProvider.of<SaveBookingCubit>(context).delete(widget.model);
      },
    );
  }

  _onDeleteSuccess(Booking booking) {
    showSnackBar(context, "booking.delete_success");
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
      child: FutureBuilder(
          future: _cubitInitialized,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildPage();
            }
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }),
    );
  }

  Widget _buildPage() {
    return BlocConsumer<SaveBookingCubit, SaveBookingState>(
      buildWhen: (previous, current) {
        return previous.draft != current.draft;
      },
      listener: (context, state) {
        state.whenOrNull(
          loaded: (draft) => _onUploadSuccess(draft),
          deleted: (_, booking) => _onDeleteSuccess(booking),
          error: (draft, error) => _onError(error),
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.draft.isCreating ? "booking.new_title" : "booking.edit_title").tr(),
            actions: [
              TransactionTypeButton(draft: state.draft),
              if (!state.draft.isCreating) _buildDeleteButton(),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: state.maybeWhen(
            loading: (draft) => Center(child: CircularProgressIndicator()),
            loaded: (draft) => Center(child: CircularProgressIndicator()),
            orElse: () => _buildContent(state.draft),
          ),
        );
      },
    );
  }

  Widget _buildContent(BookingDraft draft) {
    return SafeArea(
      child: Padding(
        padding: AppDimensions.pagePadding,
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            SaveBookingTab1(draft: draft, onCategoryTap: () => _openCategories(draft), amountDisplayKey: _amountDisplayKey),
            SaveBookingTab2(draft: draft),
          ],
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: _onDelete,
    );
  }
}
