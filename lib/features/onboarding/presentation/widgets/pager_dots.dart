import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';

class PagerDots extends StatelessWidget {
  final int count;
  final int currentIndex;
  // NEW: Callback triggered when a dot is tapped
  final ValueChanged<int>? onDotTap;

  const PagerDots({
    super.key,
    required this.count,
    required this.currentIndex,
    this.onDotTap, // NEW
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool active = index == currentIndex;
        // NEW: Detect tap on a dot and trigger callback using gesture detector
        return GestureDetector(
          onTap: () => onDotTap?.call(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 260),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: active ? 20 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: active
                  ? AppColors.primaryColor
                  : AppColors.grayNeutral[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      }),
    );
  }
}
