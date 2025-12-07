import 'package:flutter/material.dart';

/// A reusable hero image widget that shows:
/// - A background image (slightly zoomed or dimmed)
/// - A foreground main image
/// - Optional parallax effect (based on page scroll)
///
/// Used on all onboarding pages.
class HeroImages extends StatelessWidget {
  final String backgroundImage;
  final String foregroundImage;

  /// A value between 0.0 and 1.0 coming from PageView's scroll progress.
  final double progress;

  const HeroImages({
    super.key,
    required this.backgroundImage,
    required this.foregroundImage,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background image slightly moves slower = parallax effect.
          Positioned(
            top: 130,
            left: 130,
            child: Transform.translate(
              offset: Offset(progress * -40, 0),
              child: Image.asset(
                backgroundImage,
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Foreground image moves opposite direction for depth.
          Positioned(
            top: 00,
            right: 60,
            child: Transform.translate(
              offset: Offset(progress * 20, 0),
              child: Image.asset(
                foregroundImage,
                width: 470,
                height: 470,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
