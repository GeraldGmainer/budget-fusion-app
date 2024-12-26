import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Widget? separator;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;

  const TransactionList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.separator,
    this.padding = EdgeInsets.zero,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      shrinkWrap: true,
      physics: physics,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      separatorBuilder: (context, index) =>
          separator ??
          const Divider(
            color: Colors.grey,
            thickness: 1,
            // indent: 16,
            // endIndent: 16,
          ),
    );
  }
}
