import 'package:flutter/material.dart';

class CreateBookingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "CreateBookingButton",
      onPressed: () {
        // TODO
        // Navigator.of(context).pushNamed(BookingCrudPage.route, arguments: BookingModel.empty());
      },
      child: const Icon(Icons.add),
    );
  }
}
