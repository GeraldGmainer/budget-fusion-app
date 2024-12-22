import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart' as crf;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomHorizontalIndicator extends StatefulWidget {
  final Widget child;
  final AsyncCallback onRefresh;
  final crf.IndicatorController? controller;
  final GlobalKey? indicatorKey;

  const CustomHorizontalIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.controller,
    this.indicatorKey,
  });

  @override
  State<CustomHorizontalIndicator> createState() => _CustomHorizontalIndicatorState();
}

class _CustomHorizontalIndicatorState extends State<CustomHorizontalIndicator> with SingleTickerProviderStateMixin {
  Future<void> _handleRefresh() async {
    await widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return crf.CustomRefreshIndicator(
      key: widget.indicatorKey,
      controller: widget.controller,
      onRefresh: _handleRefresh,
      trigger: crf.IndicatorTrigger.trailingEdge,
      triggerMode: crf.IndicatorTriggerMode.onEdge,
      builder: (BuildContext context, Widget child, crf.IndicatorController controller) {
        final bool showSpinner = controller.isDragging || controller.isArmed || controller.isLoading;
        final bool showPartialProgress = controller.isDragging || controller.isArmed;
        final double? progressValue = showPartialProgress ? controller.value.clamp(0.0, 1.0) : null; // null = indeterminate spinner

        return Stack(
          alignment: Alignment.center,
          children: [
            child,
            Positioned(
              left: 16,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCirc,
                opacity: showSpinner ? 1.0 : 0.0,
                child: Material(
                  shape: const CircleBorder(),
                  elevation: 4.0,
                  color: Theme.of(context).canvasColor,
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: RefreshProgressIndicator(
                      indicatorPadding: EdgeInsets.all(6.0),
                      valueColor: AlwaysStoppedAnimation(AppColors.accentColor),
                      backgroundColor: Theme.of(context).canvasColor,
                      strokeWidth: 3.0,
                      value: progressValue,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
