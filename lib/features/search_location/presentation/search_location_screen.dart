import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/skip_button.dart';

class SearchLocationScreen extends StatelessWidget {
  const SearchLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(ScreenPadding.horizontal),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: LayoutTokens.xxl,
                bottom: ScreenPadding.horizontal,
                //right: ScreenPadding.horizontal,
              ),
              child: Align(
                alignment: AlignmentGeometry.centerRight,
                child: SkipButton(onTap: () {}),
              ),
            ),
            SizedBox(height: 75),
            Image.asset(
              "assets/choose_location_assets/search_map_image.png",
              scale: 1,
              width: 297.55,
              height: 215.47,
            ),
            SizedBox(height: 46),

            Text(
              "Hi, Nice to meet you !",
              style: AppTextStyles.heading5SemiBold.copyWith(
                color: AppColors.grayNeutral[800],
              ),
            ),
            SizedBox(height: LayoutTokens.md),
            Text(
              textAlign: TextAlign.center,

              "       Choose your location to find property\n around you",
              style: AppTextStyles.paragraph2Regular.copyWith(
                color: AppColors.grayNeutral[400],
              ),
            ),
            SizedBox(height: 104),
            AppButton(
              size: ButtonSize.large,
              label: "Use current location",
              variant: ButtonVariant.primary,
              onPressed: () {},
            ),
            SizedBox(height: LayoutTokens.md),
            AppButton(
              size: ButtonSize.large,
              label: "Select it Manually",
              variant: ButtonVariant.secondary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
