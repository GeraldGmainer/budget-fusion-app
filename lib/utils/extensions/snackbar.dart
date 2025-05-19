import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../core/exceptions/app_error.dart';

extension SnackBarExtensions on BuildContext {
  void showSnackBar(
    String translationKey, {
    Duration duration = const Duration(seconds: 3),
    Color? backgroundColor,
    bool vibrate = false,
    bool floating = false,
  }) {
    final messenger = ScaffoldMessenger.of(this);

    messenger.showSnackBar(
      SnackBar(
        content: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => messenger.hideCurrentSnackBar(), child: Text(translationKey.tr())),
        backgroundColor: backgroundColor,
        behavior: floating ? SnackBarBehavior.floating : null,
        duration: duration,
      ),
    );

    if (vibrate) {
      Haptics.vibrate(HapticsType.error);
    }
  }

  void showErrorSnackBar(AppError error, {Duration? duration, bool vibrate = true, bool floating = false}) {
    showSnackBar(
      error.translationKey,
      duration: duration ?? const Duration(seconds: 4),
      backgroundColor: AppColors.errorColor,
      vibrate: vibrate,
      floating: floating,
    );
  }

  void showComingSoon([String message = 'This feature is coming soon ...']) {
    showSnackBar(message, duration: const Duration(seconds: 2));
  }
}

// TODO maybe not required anymore?
class ScaffoldProvider extends ChangeNotifier {
  BuildContext? scaffoldContext;

  void setScaffoldContext(BuildContext ctx) {
    scaffoldContext = ctx;
  }
}
