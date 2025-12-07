import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';

import 'package:housely/core/enums/enums.dart';

import 'package:housely/core/widgets/app_button.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;

  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppButton(
        bordercolor: AppColors.white,
        width: 57,
        height: 32,
        //bgcolor: AppColors.grayNeutral[200],
        variant: ButtonVariant.secondary,
        label: "Skip",
        onPressed: () {
          print("object");
        },
        size: ButtonSize.small,
      ),
    );
  }
}
