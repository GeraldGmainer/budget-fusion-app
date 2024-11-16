import 'package:flutter/material.dart';

class TransferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "TransferButton",
      onPressed: () {
        // TODO
        // Navigator.of(context).pushNamed(BookingCrudPage.route, arguments: BookingModel.empty());
      },
      child: const Icon(Icons.swap_horiz),
    );
  }
}
