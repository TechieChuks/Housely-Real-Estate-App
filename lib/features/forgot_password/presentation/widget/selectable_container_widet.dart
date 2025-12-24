import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/utils/layout.dart';

class SelectableContainer extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const SelectableContainer({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 76,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.grayNeutral[300]!,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: LayoutTokens.md),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary[100],
                  borderRadius: BorderRadius.circular(30),
                ),

                child: Icon(icon, color: AppColors.primaryColor, size: 24),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      title,
                      style: AppTextStyles.paragraph4Regular.copyWith(
                        fontSize: 16,
                        color: AppColors.grayNeutral[300],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subTitle,
                      style: AppTextStyles.paragraph4Regular.copyWith(
                        fontSize: 14,
                        color: AppColors.grayNeutral[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
