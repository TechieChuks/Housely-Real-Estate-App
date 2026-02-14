import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/profile_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profile",
            style: AppTextStyles.paragraph1SemiBold.copyWith(
              fontSize: 25,
              color: AppColors.grayNeutral[800],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          ProfilePicture(),
          SizedBox(height: LayoutTokens.md),
          Center(
            child: Text(
              'Chukwuemeka Augustine',
              style: AppTextStyles.paragraph1SemiBold.copyWith(
                color: AppColors.grayNeutral[800],
              ),
            ),
          ),
          Center(
            child: Text(
              'chuksanoliefo@gmail.com',
              style: AppTextStyles.paragraph1Regular.copyWith(
                color: AppColors.grayNeutral[400],
              ),
            ),
          ),
          SizedBox(height: LayoutTokens.xxxl),
          SizedBox(width: 398, child: Divider()),
          SizedBox(height: LayoutTokens.xl),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/editprofilescreen");
            },
            title: Text("Settings"),
            leading: Icon(
              Icons.settings_outlined,
              color: AppColors.primaryColor,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Payment"),
            leading: Icon(
              color: AppColors.primaryColor,
              Icons.account_balance_wallet_outlined,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Notification"),
            leading: Icon(
              color: AppColors.primaryColor,
              Icons.notifications_outlined,
            ),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            title: Text("Recent Viewed"),
            leading: Icon(color: AppColors.primaryColor, Icons.access_time),
            trailing: Icon(Icons.chevron_right),
          ),

          ListTile(
            title: Text("About"),
            leading: Icon(color: AppColors.primaryColor, Icons.info_outline),
            trailing: Icon(Icons.chevron_right),
          ),
          SizedBox(height: 40),
          Text(
            "Sign Out",
            style: AppTextStyles.paragraph1Medium.copyWith(
              color: AppColors.error[400],
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
