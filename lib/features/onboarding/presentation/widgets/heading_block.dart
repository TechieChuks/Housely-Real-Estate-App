import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/utils/layout.dart';

/// Reusable block for onboarding headings & descriptions.
class HeadingBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? highlightText; // optional
  final TextStyle? highlightStyle;

  const HeadingBlock({
    super.key,
    required this.title,
    required this.subtitle,
    this.highlightText,
    this.highlightStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ScreenPadding.horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: LayoutTokens.md),
          Text(
            textAlign: TextAlign.center,
            subtitle,
            style: AppTextStyles.paragraph2Regular.copyWith(
              fontSize: 20,
              color: AppColors.grayNeutral[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final textToHighlight = highlightText;

    if (textToHighlight == null ||
        !title.contains(textToHighlight) ||
        textToHighlight.isEmpty) {
      return Text(title, style: AppTextStyles.heading4Regular);
    }

    final parts = title.split(textToHighlight);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.heading4Regular.copyWith(fontSize: 39),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: textToHighlight,
            style:
                highlightStyle ??
                AppTextStyles.heading4Regular.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          if (parts.length > 1) TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
