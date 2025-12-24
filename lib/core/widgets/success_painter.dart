import 'dart:math';

import 'package:flutter/material.dart';

class SuccessPainter extends CustomPainter {
  final double progress;

  SuccessPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2.5;

    /// Outer success circle
    final circlePaint = Paint()
      ..color = const Color(0xFF7B5CE1).withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      circlePaint,
    );

    /// Shield background
    final shieldPaint = Paint()
      ..color = const Color(0xFF7B5CE1)
      ..style = PaintingStyle.fill;

    final shieldPath = Path()
      ..moveTo(center.dx, center.dy - 35)
      ..lineTo(center.dx + 40, center.dy - 10)
      ..lineTo(center.dx + 30, center.dy + 45)
      ..lineTo(center.dx, center.dy + 65)
      ..lineTo(center.dx - 30, center.dy + 45)
      ..lineTo(center.dx - 40, center.dy - 10)
      ..close();

    canvas.drawPath(shieldPath, shieldPaint);

    /// Checkmark line animation
    final checkPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final checkPath = Path()
      ..moveTo(center.dx - 15, center.dy + 5)
      ..lineTo(center.dx - 2, center.dy + 18)
      ..lineTo(center.dx + 20, center.dy - 10);

    final metrics = checkPath.computeMetrics().first;
    final extractPath = metrics.extractPath(
      0,
      metrics.length * progress.clamp(0.0, 1.0),
    );

    canvas.drawPath(extractPath, checkPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
