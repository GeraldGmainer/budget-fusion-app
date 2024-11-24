import 'package:flutter/material.dart';
import 'package:budget_fusion_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String route = "ForgotPasswordPage";

  @override
  Widget build(BuildContext context) {
    final scaffoldProvider = Provider.of<ScaffoldProvider>(context, listen: false);

    return Scaffold(
      body: Builder(builder: (ctx) {
        scaffoldProvider.setScaffoldContext((ctx));
        return Center(child: Text("ForgotPasswordPage"));
      }),
    );
  }
}
