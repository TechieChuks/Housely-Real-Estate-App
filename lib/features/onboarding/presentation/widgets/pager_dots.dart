import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';

class PagerDots extends StatelessWidget {
  final int count;
  final int currentIndex;

  const PagerDots({super.key, required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool active = index == currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 260),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: active ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: active ? AppColors.primaryColor : AppColors.grayNeutral[300],
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}
