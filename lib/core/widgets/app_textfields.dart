import 'package:flutter/material.dart';
import 'package:housely/core/enums/enums.dart';

class AppTextInput extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final TextInputState state;
  final bool obscureText;
  final bool isLarge;

  const AppTextInput({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.state = TextInputState.defaultState,
    this.obscureText = false,
    this.isLarge = true, // Large or Medium
  });

  @override
  Widget build(BuildContext context) {
    // Colors based on state
    Color getBorderColor() {
      switch (state) {
        case TextInputState.error:
          return Colors.red;
        case TextInputState.success:
          return Colors.green;
        case TextInputState.pressed:
        case TextInputState.typing:
          return Colors.deepPurple;
        default:
          return Colors.deepPurple.withValues(alpha: 0.4);
      }
    }

    bool isDisabled = state == TextInputState.disabled;

    Color getFillColor() {
      if (isDisabled) return Colors.grey.shade200;
      if (state == TextInputState.filled) {
        return Colors.deepPurple.withValues(alpha: 0.05);
      }
      return Colors.white;
    }

    // Sizes
    final double height = isLarge ? 22 : 16;
    final double fontSize = isLarge ? 16 : 14;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),

        TextField(
          controller: controller,
          enabled: !isDisabled,
          keyboardType: keyboardType,
          obscureText: obscureText,
          style: TextStyle(fontSize: fontSize),

          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: getFillColor(),
            suffixIcon: suffixIcon,

            contentPadding: EdgeInsets.symmetric(
              vertical: height,
              horizontal: 16,
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: getBorderColor(), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: getBorderColor(), width: 1.7),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.4),
            ),
          ),
        ),
      ],
    );
  }
}
