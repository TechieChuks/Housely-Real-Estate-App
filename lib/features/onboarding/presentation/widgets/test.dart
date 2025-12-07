import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/utils/layout.dart';

/// Reusable block for onboarding headings & descriptions.
class HeadingBlock extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeadingBlock({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "Find the ",
              style: AppTextStyles.heading4Regular.copyWith(fontSize: 39),
              children: [
                TextSpan(
                  text: "perfect place",
                  style: AppTextStyles.heading4SemiBold.copyWith(fontSize: 39),
                ),
                TextSpan(
                  text: " for your future house",
                  style: AppTextStyles.heading4Regular.copyWith(fontSize: 39),
                ),
              ],
            ),
          ),
          const SizedBox(height: LayoutTokens.md),
          Text(
            subtitle,
            style: AppTextStyles.paragraph2Regular.copyWith(
              color: AppColors.grayNeutral[400],
            ),
          ),
        ],
      ),
    );
  }
}
