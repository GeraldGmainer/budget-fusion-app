import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:budget_fusion_app/core/core.dart';

class SaveButton extends StatelessWidget {
  final double loadingSize = 18;
  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  final Color backgroundColor;

  const SaveButton({
    this.text = "button.edit",
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor = AppColors.accentColor,
  });

  void _onTap() {
    onTap.call();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.75,
      child: ElevatedButton(
        onPressed: isLoading ? null : _onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: loadingSize,
              height: loadingSize,
              child: isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2,
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 8), // Add some spacing
            Text(text, style: const TextStyle(fontSize: 16)).tr(),
            SizedBox(width: loadingSize),
          ],
        ),
      ),
    );
  }
}
