import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/widgets/app_button.dart';

import 'package:housely/features/success_reset/presentation/widgets/custom_painter_widget.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                return CustomPaint(
                  size: const Size(180, 180),
                  painter: SuccessPainter(_controller.value),
                );
              },
            ),
            const SizedBox(height: 40),
            Text(
              'Success!',
              style: AppTextStyles.heading5SemiBold.copyWith(
                color: AppColors.grayNeutral[800],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Your password has been changed. Please \n log in again with a new password.',
                textAlign: TextAlign.center,
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 18,
                  color: AppColors.grayNeutral[400],
                ),
              ),
            ),
            const SizedBox(height: 199),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                // height: 56,
                child: AppButton(
                  size: ButtonSize.large,
                  variant: ButtonVariant.primary,
                  label: "Continue",
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
