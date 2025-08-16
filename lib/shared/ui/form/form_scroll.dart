import 'package:flutter/material.dart';

import '../../../core/core.dart';

class FormScroll extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;

  const FormScroll({
    super.key,
    required this.child,
    this.padding,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    return ScrollConfiguration(
      behavior: const _NoGlow(),
      child: Scrollbar(
        child: SingleChildScrollView(
          controller: controller,
          primary: controller == null,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: (padding ?? AppDimensions.pageCardPadding).add(EdgeInsets.only(bottom: bottomInset + 16)),
          child: child,
        ),
      ),
    );
  }
}

class _NoGlow extends ScrollBehavior {
  const _NoGlow();

  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}
