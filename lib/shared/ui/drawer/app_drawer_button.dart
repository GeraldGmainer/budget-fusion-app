import 'package:flutter/material.dart';

class AppDrawerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Colors.white),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
