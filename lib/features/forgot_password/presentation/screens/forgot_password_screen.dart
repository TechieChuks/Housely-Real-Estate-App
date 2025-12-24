import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/features/forgot_password/presentation/widget/selectable_container_widet.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isPhoneSelected = false;
  bool isEmailSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(LayoutTokens.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Forgot Password",
                style: AppTextStyles.heading5SemiBold.copyWith(fontSize: 30),
              ),
              SizedBox(height: LayoutTokens.md),
              Text(
                "Select which contact details should we use to reset your password",
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 21,
                  color: AppColors.grayNeutral[400],
                ),
              ),
              SizedBox(height: LayoutTokens.xl),
              SelectableContainer(
                isSelected: isPhoneSelected,
                icon: Icons.phone,
                title: "Via Phone",
                subTitle: "07065098462",
                onTap: () {
                  setState(() {
                    isPhoneSelected = true;
                    isEmailSelected = false;
                  });
                },
              ),
              SizedBox(height: 16),
              SelectableContainer(
                isSelected: isEmailSelected,
                icon: Icons.email_rounded,
                title: "Via Email",
                subTitle: "chuksanoliefo@gmail.com",
                onTap: () {
                  setState(() {
                    isPhoneSelected = false;
                    isEmailSelected = true;
                  });
                },
              ),
              SizedBox(height: 292),
              AppButton(
                size: ButtonSize.large,
                variant: ButtonVariant.primary,
                label: "Continue",
                onPressed: () {
                  if (isPhoneSelected == true) {
                    debugPrint("Hello phone");
                  }
                  if (isEmailSelected == true) {
                    Navigator.pushNamed(context, "/resetpassword");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
