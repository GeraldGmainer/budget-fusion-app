import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  _refresh(BuildContext context) {
    // TODO
    // BlocProvider.of<GraphViewBloc>(context).add(RefreshGraphViewEvent());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () {
        _refresh(context);
      },
    );
  }
}
