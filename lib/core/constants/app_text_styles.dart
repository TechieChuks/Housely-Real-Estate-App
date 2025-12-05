import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // ------------------------------------------------------------
  // Helper function to make styles cleaner
  // ------------------------------------------------------------
  static TextStyle _text(
    double size,
    FontWeight weight, {
    Color? color,
    double? height,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size,
      height: height ?? 1.2,
      fontWeight: weight,
      color: color ?? AppColors.textPrimary,
    );
  }

  // ------------------------------------------------------------
  // DISPLAY (Large hero text)
  // ------------------------------------------------------------
  static final display1Regular = _text(72, FontWeight.w400);
  static final display1Medium = _text(72, FontWeight.w500);
  static final display1SemiBold = _text(72, FontWeight.w600);
  static final display1Bold = _text(72, FontWeight.w700);

  static final display2Regular = _text(60, FontWeight.w400);
  static final display2Medium = _text(60, FontWeight.w500);
  static final display2SemiBold = _text(60, FontWeight.w600);
  static final display2Bold = _text(60, FontWeight.w700);

  // ------------------------------------------------------------
  // HEADINGS
  // ------------------------------------------------------------
  static final heading1Regular = _text(48, FontWeight.w400);
  static final heading1Medium = _text(48, FontWeight.w500);
  static final heading1SemiBold = _text(48, FontWeight.w600);
  static final heading1Bold = _text(48, FontWeight.w700);

  static final heading2Regular = _text(36, FontWeight.w400);
  static final heading2Medium = _text(36, FontWeight.w500);
  static final heading2SemiBold = _text(36, FontWeight.w600);
  static final heading2Bold = _text(36, FontWeight.w700);

  static final heading3Regular = _text(30, FontWeight.w400);
  static final heading3Medium = _text(30, FontWeight.w500);
  static final heading3SemiBold = _text(30, FontWeight.w600);
  static final heading3Bold = _text(30, FontWeight.w700);

  static final heading4Regular = _text(24, FontWeight.w400);
  static final heading4Medium = _text(24, FontWeight.w500);
  static final heading4SemiBold = _text(24, FontWeight.w600);
  static final heading4Bold = _text(24, FontWeight.w700);

  static final heading5Regular = _text(20, FontWeight.w400);
  static final heading5Medium = _text(20, FontWeight.w500);
  static final heading5SemiBold = _text(20, FontWeight.w600);
  static final heading5Bold = _text(20, FontWeight.w700);

  // ------------------------------------------------------------
  // PARAGRAPHS
  // ------------------------------------------------------------
  static final paragraph1Regular = _text(18, FontWeight.w400, height: 1.5);
  static final paragraph1Medium = _text(18, FontWeight.w500, height: 1.5);
  static final paragraph1SemiBold = _text(18, FontWeight.w600, height: 1.5);
  static final paragraph1Bold = _text(18, FontWeight.w700, height: 1.5);

  static final paragraph2Regular = _text(16, FontWeight.w400, height: 1.5);
  static final paragraph2Medium = _text(16, FontWeight.w500, height: 1.5);
  static final paragraph2SemiBold = _text(16, FontWeight.w600, height: 1.5);
  static final paragraph2Bold = _text(16, FontWeight.w700, height: 1.5);

  static final paragraph3Regular = _text(14, FontWeight.w400, height: 1.5);
  static final paragraph3Medium = _text(14, FontWeight.w500, height: 1.5);
  static final paragraph3SemiBold = _text(14, FontWeight.w600, height: 1.5);
  static final paragraph3Bold = _text(14, FontWeight.w700, height: 1.5);

  static final paragraph4Regular = _text(12, FontWeight.w400, height: 1.5);
  static final paragraph4Medium = _text(12, FontWeight.w500, height: 1.5);
  static final paragraph4SemiBold = _text(12, FontWeight.w600, height: 1.5);
  static final paragraph4Bold = _text(12, FontWeight.w700, height: 1.5);

  // ------------------------------------------------------------
  // LABELS
  // ------------------------------------------------------------
  static final label1Regular = _text(11, FontWeight.w400);
  static final label1Medium = _text(11, FontWeight.w500);
  static final label1SemiBold = _text(11, FontWeight.w600);
  static final label1Bold = _text(11, FontWeight.w700);

  static final label2Regular = _text(10, FontWeight.w400);
  static final label2Medium = _text(10, FontWeight.w500);
  static final label2SemiBold = _text(10, FontWeight.w600);
  static final label2Bold = _text(10, FontWeight.w700);

  static final label3Regular = _text(9, FontWeight.w400);
  static final label3Medium = _text(9, FontWeight.w500);
  static final label3SemiBold = _text(9, FontWeight.w600);
  static final label3Bold = _text(9, FontWeight.w700);
}
