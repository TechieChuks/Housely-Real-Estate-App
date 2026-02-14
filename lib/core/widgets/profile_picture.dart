import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/profile_assets/tech.png"),
          ),
        ),
        Positioned(
          top: 115,
          left: 95,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor,
            ),

            child: Icon(Icons.camera_alt, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
