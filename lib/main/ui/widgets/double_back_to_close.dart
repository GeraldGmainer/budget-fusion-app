import 'package:budget_fusion_app/utils/extensions/snackbar.dart';
import 'package:flutter/material.dart';

class DoubleBackToClose extends StatefulWidget {
  final Widget child;

  const DoubleBackToClose({super.key, required this.child});

  @override
  State<DoubleBackToClose> createState() => _DoubleBackToCloseState();
}

class _DoubleBackToCloseState extends State<DoubleBackToClose> {
  DateTime? _lastPressed;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          if (_lastPressed == null || now.difference(_lastPressed!) > Duration(seconds: 2)) {
            _lastPressed = now;
            context.showSnackBar('shared.notifications.double_black_to_close');
            return false;
          }
          return true;
        },
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }
}
