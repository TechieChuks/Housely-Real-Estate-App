import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/app_textfields.dart';
import 'package:housely/core/widgets/app_toast.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isChecked = false;
  bool isNewPasswordVisible = false;
  bool isConfPasswordVisible = false;
  String password = '';
  final _newPassWordContoller = TextEditingController();
  final _confirmPassWordContoller = TextEditingController();
  String? newPasswordError;
  String? confirmPasswordError;

  @override
  void initState() {
    super.initState();
    _newPassWordContoller.addListener(() => setState(() {}));
    _confirmPassWordContoller.addListener(() => setState(() {}));
  }

  void validate() {
    setState(() async {
      newPasswordError = null;
      confirmPasswordError = null;
      if (_newPassWordContoller.text.isEmpty) {
        newPasswordError = "New Password is required";
      }

      if (_confirmPassWordContoller.text.isEmpty) {
        confirmPasswordError = "Password Confirm is required";
      }
      if (_confirmPassWordContoller.text.isNotEmpty &&
          _newPassWordContoller.text.isNotEmpty &&
          _newPassWordContoller.text == "1234" &&
          _confirmPassWordContoller.text == "1234") {
        AppToast.showSuccess(context, message: "Login Verified");
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, "/successscreen");
      }
      if (_newPassWordContoller.text != "1234" ||
          _confirmPassWordContoller.text != "1234") {
        AppToast.showError(context, message: "Wrong Passwords");
      }
    });
  }

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
                "Create New Password",
                style: AppTextStyles.heading5SemiBold.copyWith(fontSize: 30),
              ),
              SizedBox(height: LayoutTokens.md),
              Text(
                "Please enter a new password \nto change",
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 21,
                  color: AppColors.grayNeutral[400],
                ),
              ),
              SizedBox(height: LayoutTokens.xl),
              AppTextInput(
                onChanged: (value) => setState(() {
                  password = value;
                }),
                onSubmitted: (value) => setState(() {
                  password = value;
                }),
                errorText: newPasswordError,
                obscureText: isNewPasswordVisible,
                prefixIcon: Icon(Icons.lock),
                textInputAction: TextInputAction.done,
                controller: _newPassWordContoller,
                label: "New Password",
                hintText: "Password",
                keyboardType: TextInputType.number,
                isLarge: true,
                state: TextInputState.typing,
                suffixIcon: IconButton(
                  icon: isNewPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () => setState(() {
                    isNewPasswordVisible = !isNewPasswordVisible;
                  }),
                ),
              ),
              SizedBox(height: 16),
              AppTextInput(
                onChanged: (value) => setState(() {
                  password = value;
                }),
                onSubmitted: (value) => setState(() {
                  password = value;
                }),
                errorText: confirmPasswordError,
                obscureText: isConfPasswordVisible,
                prefixIcon: Icon(Icons.lock),
                textInputAction: TextInputAction.done,
                controller: _confirmPassWordContoller,
                label: "Confirm Password",
                hintText: "Password",
                keyboardType: TextInputType.number,
                isLarge: true,
                state: TextInputState.typing,
                suffixIcon: IconButton(
                  icon: isConfPasswordVisible
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () => setState(() {
                    isConfPasswordVisible = !isConfPasswordVisible;
                  }),
                ),
              ),
              SizedBox(height: 92),
              AppButton(
                size: ButtonSize.large,
                variant: ButtonVariant.primary,
                label: "Continue",
                onPressed: () {
                  validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
