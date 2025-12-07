import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_text_styles.dart';

import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/features/onboarding/data/model/onboarding_page_model.dart';
import 'package:housely/features/onboarding/data/onboarding_page_mock_data.dart';
import 'package:housely/features/onboarding/presentation/widgets/heading_block.dart';
import 'package:housely/features/onboarding/presentation/widgets/hero_images.dart';
import 'package:housely/features/onboarding/presentation/widgets/pager_dots.dart';
import 'package:housely/features/onboarding/presentation/widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  final List<OnboardingPageModel> pages = OnboardingPagesMockData.items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Right Skip Button
            Padding(
              padding: const EdgeInsets.only(
                top: LayoutTokens.md,
                bottom: ScreenPadding.horizontal,
                right: ScreenPadding.horizontal,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: SkipButton(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) => setState(() => _page = index),
                itemBuilder: (context, index) {
                  final page = pages[index];

                  final progress = (_controller.hasClients)
                      ? _controller.page ?? 0
                      : 0;

                  return Column(
                    children: [
                      HeroImages(
                        backgroundImage: page.background,
                        foregroundImage: page.foreground,
                        progress: (progress - index).toDouble(),
                      ),

                      const SizedBox(height: LayoutTokens.xxl),

                      HeadingBlock(
                        title: page.title,
                        subtitle: page.subtitle,
                        highlightText: page.highlight,
                        highlightStyle: AppTextStyles.heading4Bold.copyWith(
                          fontSize: 39,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: LayoutTokens.lg),

            PagerDots(count: pages.length, currentIndex: _page),

            Padding(
              padding: const EdgeInsets.all(ScreenPadding.horizontal),
              child: AppButton(
                //bgcolor: AppColors.grayNeutral[400],
                size: ButtonSize.large,
                variant: ButtonVariant.primary,

                label: _page == pages.length - 1 ? "Get Started" : "Next",
                onPressed: () {
                  if (_page == pages.length - 1) {
                    Navigator.pushReplacementNamed(context, "/login");
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
