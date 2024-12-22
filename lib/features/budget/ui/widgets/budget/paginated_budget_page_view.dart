import 'dart:async';

import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../application/application.dart';
import '../../controllers/page_controllers.dart';

class PaginatedBudgetPageView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T item) itemBuilder;

  const PaginatedBudgetPageView({super.key, required this.itemBuilder});

  @override
  PaginatedBudgetPageViewState<T> createState() => PaginatedBudgetPageViewState<T>();
}

class PaginatedBudgetPageViewState<T> extends State<PaginatedBudgetPageView<T>> {
  late final PageControllers _pageControllers;
  int _currentPage = 0;
  Completer<void>? _loadMoreCompleter;

  PageController get _pageController => _pageControllers.periodController;

  @override
  void initState() {
    super.initState();
    _pageControllers = Provider.of<PageControllers>(context, listen: false);
    _currentPage = _pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _emitCurrentPageData();
    });
  }

  void _emitCurrentPageData() {
    final bookingPageState = context.read<BookingPageBloc>().state;

    if (bookingPageState.viewItems.isEmpty) return;

    if (_currentPage >= 0 && _currentPage < bookingPageState.viewItems.length) {
      final actualIndex = bookingPageState.viewItems.length - 1 - _currentPage;
      final viewData = bookingPageState.viewItems[actualIndex];
      _pageControllers.emit(viewData);
    } else {
      BudgetLogger.instance.i("unknown page $_currentPage / ${bookingPageState.viewItems.length}");
    }
  }

  Future<void> _onLoadMore() async {
    final bookingBloc = context.read<BookingPageBloc>();
    if (bookingBloc.state.isLoading) return;
    if (bookingBloc.state.hasReachedMax) {
      showSnackBar(context, "All bookings have been loaded");
      return;
    }
    _loadMoreCompleter = Completer<void>();
    bookingBloc.add(const BookingPageEvent.loadMore());
    return _loadMoreCompleter!.future;
  }

  List<T> _extractItems(BookingPageState bookingState) {
    return bookingState.viewItems.whereType<T>().toList();
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
    _emitCurrentPageData();
  }

  void _onInitialLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        _onPageChanged(0);
      }
    });
  }

  void _onMoreLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        _onPageChanged(_currentPage + 1);
      }
    });
    _loadMoreCompleter?.complete();
    _loadMoreCompleter = null;
  }

  void _onError(String message) {
    _loadMoreCompleter?.completeError(message);
    _loadMoreCompleter = null;
    showSnackBar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingPageBloc, BookingPageState>(
      listener: (context, bookingState) {
        if (bookingState.isInitial) {
          _onInitialLoading();
        } else if (bookingState.isLoaded) {
          _onMoreLoading();
        } else if (bookingState.isError) {
          final error = bookingState.maybeWhen(error: (_, __, message, ___, ____) => message, orElse: () => "unknown error");
          _onError(error);
        }
      },
      builder: (context, bookingState) {
        final List<T> items = _extractItems(bookingState);
        final bool isInitialLoading = bookingState.isLoading && bookingState.isFirstFetch && items.isEmpty;

        return Stack(
          children: [
            if (items.isNotEmpty)
              CustomHorizontalIndicator(
                onRefresh: _onLoadMore,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: items.length,
                  onPageChanged: _onPageChanged,
                  reverse: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return widget.itemBuilder(context, items.reversed.toList()[index]);
                  },
                ),
              )
            else if (isInitialLoading)
              Center(child: CircularProgressIndicator())
            else
              Center(child: Text("No data available.".tr())),
          ],
        );
      },
    );
  }
}
