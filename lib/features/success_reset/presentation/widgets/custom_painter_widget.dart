import 'dart:math';

import 'package:flutter/material.dart';

class SuccessPainter extends CustomPainter {
  final double progress;

  SuccessPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);

    /// =======================
    /// OUTER CIRCLE
    /// =======================
    final radius = size.width * 0.45;

    final circlePaint = Paint()
      ..color = const Color(0xFF7B5CE1).withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      circlePaint,
    );

    /// =======================
    /// SHIELD (CENTERED)
    /// =======================
    final shieldPaint = Paint()
      ..color = const Color(0xFF7B5CE1)
      ..style = PaintingStyle.fill;

    const shieldWidth = 80.0;
    const shieldHeight = 90.0;

    final shieldPath = Path()
      ..moveTo(0, -shieldHeight * 0.45)
      ..lineTo(shieldWidth * 0.5, -shieldHeight * 0.15)
      ..lineTo(shieldWidth * 0.35, shieldHeight * 0.35)
      ..lineTo(0, shieldHeight * 0.55)
      ..lineTo(-shieldWidth * 0.35, shieldHeight * 0.35)
      ..lineTo(-shieldWidth * 0.5, -shieldHeight * 0.15)
      ..close();

    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.drawPath(shieldPath, shieldPaint);

    /// =======================
    /// CHECKMARK (PERFECTLY CENTERED)
    /// =======================
    final checkPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final checkPath = Path()
      ..moveTo(-12, 4)
      ..lineTo(-2, 14)
      ..lineTo(18, -8);

    final metric = checkPath.computeMetrics().first;
    final animatedPath = metric.extractPath(
      0,
      metric.length * progress.clamp(0.0, 1.0),
    );

    canvas.drawPath(animatedPath, checkPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
