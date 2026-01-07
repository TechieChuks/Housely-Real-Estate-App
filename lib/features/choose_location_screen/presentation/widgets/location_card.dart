import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';

class LocationCard extends StatelessWidget {
  final String address;
  const LocationCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .1),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.location_on, color: Colors.purple),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location Details', style: AppTextStyles.heading3Regular),
                const SizedBox(height: 6),
                Text(
                  address,
                  style: AppTextStyles.paragraph1Regular.copyWith(
                    color: AppColors.grayNeutral[700],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
