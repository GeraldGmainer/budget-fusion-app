// refresh_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/application.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onTap;

  const RefreshButton({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  bool _isLoading = false;

  void _handleRefresh() {
    setState(() {
      _isLoading = true;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingPageBloc, BookingPageState>(
      listener: (context, state) {
        if (_isLoading) {
          if (state.isLoaded) {
            setState(() {
              _isLoading = false;
            });
          }
          if (state.isError) {
            setState(() {
              _isLoading = false;
            });
          }
        }
      },
      child: IconButton(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          child: _isLoading
              ? SizedBox(
                  key: const ValueKey('loading'),
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Icon(
                  Icons.refresh,
                  key: ValueKey('refresh'),
                ),
        ),
        onPressed: _isLoading ? null : _handleRefresh,
        tooltip: _isLoading ? 'Refreshing...' : 'Refresh',
      ),
    );
  }
}
