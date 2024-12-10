import 'package:budget_fusion_app/core/constants/app_colors.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomHorizontalIndicator extends StatefulWidget {
  final Widget child;
  final AsyncCallback onRefresh;
  final IndicatorController? controller;

  const CustomHorizontalIndicator({
    super.key,
    required this.child,
    this.controller,
    required this.onRefresh,
  });

  @override
  State<CustomHorizontalIndicator> createState() => _CustomHorizontalIndicatorState();
}

class _CustomHorizontalIndicatorState extends State<CustomHorizontalIndicator> with SingleTickerProviderStateMixin {
  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  Future<void> _handleRefresh() async {
    await widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      controller: widget.controller,
      onRefresh: _handleRefresh,
      trigger: IndicatorTrigger.trailingEdge,
      triggerMode: IndicatorTriggerMode.onEdge,
      indicatorBuilder: (BuildContext context, IndicatorController controller) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            shape: BoxShape.circle,
          ),
          child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
              value: controller.isDragging || controller.isArmed ? controller.value.clamp(0.0, 1.0) : null,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
