import 'package:budget_fusion_app/core/core.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/cubits/calculator_cubit.dart';
import '../../application/cubits/save_booking_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CalculatorCubit>(context).init(widget.model?.amount.toDouble() ?? 0);
    BlocProvider.of<SaveBookingCubit>(context).init(widget.model);
    // BlocProvider.of<SuggestionBloc>(context).add(LoadSuggestionEvent());
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
    // TODO
    // showSnackBar(context, _isCreating() ? "booking.create_success" : "booking.edit_success");
    // BlocProvider.of<GraphViewBloc>(context).add(RefreshGraphViewEvent());
    // BlocProvider.of<SuggestionBloc>(context).add(LoadSuggestionEvent(forceReload: true));
    // Navigator.of(context).pop();
  }

  _onError(String error) {
    showSnackBar(context, error);
  }

  _onDelete() {
    // TODO delete
    // ConfirmDialog.show(
    //   context,
    //   headerText: "booking.dialog.delete_title",
    //   bodyText: "booking.dialog.delete_body",
    //   onOK: _deleteBooking,
    // );
  }

  _deleteBooking() {
    // TODO delete
    // BlocProvider.of<BookingCrudBloc>(context).add(DeleteBookingCrudEvent(_bookingDraft));
  }

  _onDeleteSuccess() {
    // TODO delete
    // showSnackBar(context, "booking.delete_success");
    // BlocProvider.of<GraphViewBloc>(context).add(RefreshGraphViewEvent());
    // Navigator.of(context).pop();
    // BlocProvider.of<SuggestionBloc>(context).add(LoadSuggestionEvent(forceReload: true));
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
      child: BlocConsumer<SaveBookingCubit, SaveBookingState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: (draft) => _onUploadSuccess(draft),
            error: (draft, error) => _onError(error),
          );
          // TODO delete
          // if (state is BookingCrudDeletedState) {
          //   _onDeleteSuccess();
          // }
        },
        builder: (context, state) {
          return _buildView(state.draft);
        },
      ),
    );
  }

  Widget _buildView(BookingDraft draft) {
    return Scaffold(
      appBar: AppBar(
        title: Text(draft.isCreating ? "booking.new_title" : "booking.edit_title").tr(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (_currentPage != 0) {
              _animateToPage(0);
            } else {
              context.pop();
            }
          },
        ),
        actions: [
          CategoryTypeButton(draft: draft, categoryType: CategoryType.outcome),
          CategoryTypeButton(draft: draft, categoryType: CategoryType.income),
          if (!draft.isCreating) _buildDeleteButton(),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<SaveBookingCubit, SaveBookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            loading: (draft) => Center(child: CircularProgressIndicator()),
            orElse: () => _buildContent(draft),
          );
        },
      ),
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
