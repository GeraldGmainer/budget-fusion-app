import 'package:budget_fusion_app/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<T?> showSelectionBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  T? selectedItem,
  Widget Function(T)? labelBuilder,
  Widget Function(T)? iconBuilder,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    showDragHandle: true,
    builder: (BuildContext bottomSheetContext) {
      return _SelectionBottomSheet<T>(
        title: title,
        items: items,
        selectedItem: selectedItem,
        labelBuilder: labelBuilder,
        iconBuilder: iconBuilder,
      );
    },
  );
}

class _SelectionBottomSheet<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final Widget Function(T)? labelBuilder;
  final Widget Function(T)? iconBuilder;

  const _SelectionBottomSheet({
    super.key,
    required this.title,
    required this.items,
    this.selectedItem,
    this.labelBuilder,
    this.iconBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) => _buildTile(context, items[index]),
              ),
            ),
            SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, T item) {
    return ListTile(
      leading: iconBuilder != null ? iconBuilder!(item) : null,
      title: labelBuilder != null ? labelBuilder!(item) : Text(item.toString()),
      trailing: selectedItem == item ? Icon(Icons.check, color: AppColors.accentColor) : null,
      onTap: () => Navigator.pop(context, item),
    );
  }
}
