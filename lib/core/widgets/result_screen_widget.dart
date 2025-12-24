import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/success_painter.dart';

class ResultScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const ResultScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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

            /// TITLE
            Text(
              widget.title,
              style: AppTextStyles.heading5SemiBold.copyWith(
                color: AppColors.grayNeutral[800],
              ),
            ),

            const SizedBox(height: 12),

            /// SUBTITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 18,
                  color: AppColors.grayNeutral[400],
                ),
              ),
            ),

            //  const Spacer(),
            const SizedBox(height: 190),

            /// ACTION BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: AppButton(
                  size: ButtonSize.large,
                  variant: ButtonVariant.primary,
                  label: widget.buttonText,
                  onPressed: widget.onButtonPressed,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
