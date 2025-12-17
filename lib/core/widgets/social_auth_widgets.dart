import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/utils/layout.dart';

class SocialsAuthWidgets extends StatelessWidget {
  const SocialsAuthWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayNeutral[200],
            ),
            child: Image.asset("assets/social_assets/fb.png"),
          ),
        ),
        SizedBox(width: LayoutTokens.md),
        InkWell(
          onTap: () {},
          child: Container(
            width: 56,
            height: 56,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grayNeutral[200],
            ),
            child: Image.asset("assets/social_assets/google.png"),
          ),
        ),
      ],
    );
  }
}
