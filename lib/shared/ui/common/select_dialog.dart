import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<T?> showSelectionDialog<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  T? selectedItem,
  Widget Function(T)? itemLabelBuilder,
}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext dialogContext) {
      return _SelectionDialog<T>(
        title: title,
        items: items,
        selectedItem: selectedItem,
        itemLabelBuilder: itemLabelBuilder,
      );
    },
  );
}

class _SelectionDialog<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final T? selectedItem;
  final Widget Function(T)? itemLabelBuilder;

  const _SelectionDialog({
    super.key,
    required this.title,
    required this.items,
    this.selectedItem,
    this.itemLabelBuilder,
  });

  Widget _buildTile(BuildContext context, T item) {
    return ListTile(
      leading: Radio<T>(
        value: item,
        groupValue: selectedItem,
        onChanged: (T? value) {
          Navigator.pop(context, value);
        },
      ),
      title: itemLabelBuilder != null ? itemLabelBuilder!(item) : Text(item.toString()),
      onTap: () => Navigator.pop(context, item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title.tr()),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => _buildTile(context, items[index]),
        ),
      ),
    );
  }
}
