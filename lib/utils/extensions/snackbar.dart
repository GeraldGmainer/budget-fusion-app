import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

void showSnackBar(BuildContext? context, String message) {
  if (context == null) {
    BudgetLogger.instance.w("showSnackBar: context is NULL");
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message).tr(),
    ),
  );
}

void showErrorSnackBar(BuildContext? context, String message, {Duration? duration}) {
  if (context == null) {
    BudgetLogger.instance.w("showSnackBar: context is NULL");
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message).tr(),
      backgroundColor: AppColors.errorColor,
      duration: duration ?? Duration(seconds: 4),
    ),
  );
}

class ScaffoldProvider extends ChangeNotifier {
  BuildContext? scaffoldContext;

  void setScaffoldContext(BuildContext ctx) {
    scaffoldContext = ctx;
    // notifyListeners();
  }
}
