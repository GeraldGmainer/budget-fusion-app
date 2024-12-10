import 'dart:async';

import 'package:budget_fusion_app/shared/shared.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/application.dart';

class PaginatedBudgetPageView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T item) itemBuilder;

  const PaginatedBudgetPageView({super.key, required this.itemBuilder});

  @override
  PaginatedBudgetPageViewState<T> createState() => PaginatedBudgetPageViewState<T>();
}

class PaginatedBudgetPageViewState<T> extends State<PaginatedBudgetPageView<T>> {
  late PageController _pageController;
  int _currentPage = 0;

  Completer<void>? _loadMoreCompleter;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onLoadMore() async {
    final bookingBloc = context.read<BookingPageBloc>();
    if (!bookingBloc.state.canLoadMore || bookingBloc.state.isLoading) return;
    _loadMoreCompleter = Completer<void>();
    bookingBloc.add(const BookingPageEvent.loadMore());
    return _loadMoreCompleter!.future;
  }

  List<T> _extractItems(BookingPageState bookingState) {
    return bookingState.summaries as List<T>;
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPage = pageIndex;
    });
  }

  void _onInitialLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
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
              Center(child: Text("No data available.")),
          ],
        );
      },
    );
  }
}
