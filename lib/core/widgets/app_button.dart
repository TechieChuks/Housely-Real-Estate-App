import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final double? width;
  final Color? bgcolor;
  final Color? bordercolor;
  final double? height;
  final Widget? icon; // optional

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgcolor,
    this.bordercolor,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.medium,
    this.width,
    this.height,
    this.icon,
  });

  // ----------------------------------------------------------
  // BUTTON PADDING BASED ON SIZE
  // ----------------------------------------------------------
  EdgeInsets get _padding {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 8, horizontal: 14);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 12, horizontal: 18);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 22);
    }
  }

  // ----------------------------------------------------------
  // FONT SIZE (BASED ON Figma hierarchy)
  // S: paragraph4 / M: paragraph3 / L: paragraph2
  // ----------------------------------------------------------
  TextStyle get _textStyle {
    switch (size) {
      case ButtonSize.small:
        return AppTextStyles.paragraph4Medium.copyWith(color: _textColor);
      case ButtonSize.medium:
        return AppTextStyles.paragraph3Medium.copyWith(color: _textColor);
      case ButtonSize.large:
        return AppTextStyles.paragraph2Medium.copyWith(color: _textColor);
    }
  }

  // ----------------------------------------------------------
  // BACKGROUND COLORS
  // ----------------------------------------------------------
  Color get _backgroundColor {
    if (onPressed == null) {
      switch (variant) {
        case ButtonVariant.primary:
          return AppColors.primary[200]!;
        case ButtonVariant.secondary:
          return Colors.transparent;
        case ButtonVariant.tertiary:
          return Colors.transparent;
      }
    }

    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary[600]!;

      case ButtonVariant.secondary:
        return Colors.transparent;

      case ButtonVariant.tertiary:
        return Colors.transparent;
    }
  }

  // ----------------------------------------------------------
  // TEXT COLORS
  // ----------------------------------------------------------
  Color get _textColor {
    if (onPressed == null) return AppColors.gray[400]!;

    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.white;

      case ButtonVariant.secondary:
        return AppColors.primary[600]!;

      case ButtonVariant.tertiary:
        return AppColors.gray[700]!;
    }
  }

  // ----------------------------------------------------------
  // BORDER (ONLY SECONDARY)
  // ----------------------------------------------------------
  BorderSide get _borderSide {
    if (variant == ButtonVariant.secondary) {
      return BorderSide(
        color: onPressed == null
            ? AppColors.gray[300]!
            : AppColors.grayNeutral[200]!,
        width: 1.2,
      );
    }
    return BorderSide.none;
  }

  // ----------------------------------------------------------
  // BUILD WIDGET
  // ----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgcolor ?? _backgroundColor,
          padding: _padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: _borderSide,
          ),
          foregroundColor: _textColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 6)],
            Text(label, style: _textStyle),
          ],
        ),
      ),
    );
  }
}
