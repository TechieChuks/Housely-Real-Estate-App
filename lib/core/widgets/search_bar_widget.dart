import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/utils/layout.dart';

class LocationSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final VoidCallback onBack;
  const LocationSearchBar({
    super.key,
    required this.onChanged,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onBack, icon: Icon(Icons.arrow_back)),
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(
              horizontal: ScreenPadding.horizontal / 2,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.08),
                  blurRadius: 10,
                ),
              ],
            ),
            child: TextField(
              onChanged: onChanged,
              decoration: const InputDecoration(
                icon: Icon(Icons.search, color: Colors.purple),
                hintText: "Search Location",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
