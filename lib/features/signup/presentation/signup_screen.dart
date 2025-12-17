import 'package:flutter/material.dart';

import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/app_textfields.dart';
import 'package:housely/core/widgets/social_auth_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  String password = '';
  bool isPasswordVisible = false;
  bool isChecked = false;

  String? emailError;
  String? passwordError;
  String? userNameError;
  void validate() {
    setState(() {
      emailError = null;
      passwordError = null;
      if (_emailController.text.isEmpty) {
        emailError = "Email is required";
      }

      if (_passwordController.text.isEmpty) {
        passwordError = "Password is required";
      }

      if (_userNameController.text.isEmpty) {
        userNameError = "Usernamre is required";
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ScreenPadding.horizontal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: LayoutTokens.lg),
            Text(
              textAlign: TextAlign.left,
              "Register Account",
              style: AppTextStyles.heading5Bold.copyWith(fontSize: 33),
            ),
            Text(
              "Sign in with your email and password \n or social media to continue",
              style: AppTextStyles.paragraph4Regular.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w200,
              ),
            ),
            SizedBox(height: LayoutTokens.xl),

            AppTextInput(
              controller: _emailController,
              errorText: emailError,
              prefixIcon: Icon(Icons.mail),
              textInputAction: TextInputAction.done,
              label: "Email",
              hintText: "Chuksanoliefo@gmail.com",
              keyboardType: TextInputType.emailAddress,
              isLarge: true,
              state: TextInputState.typing,
              suffixIcon: _emailController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      onPressed: _emailController.clear,
                      icon: Icon(Icons.close),
                    ),
            ),
            SizedBox(height: LayoutTokens.md),

            AppTextInput(
              controller: _userNameController,
              errorText: userNameError,
              prefixIcon: Icon(Icons.account_circle),
              textInputAction: TextInputAction.done,
              label: "Username",
              hintText: "TechieChuks",
              keyboardType: TextInputType.name,
              isLarge: true,
              state: TextInputState.typing,
              suffixIcon: _userNameController.text.isEmpty
                  ? Container(width: 0)
                  : IconButton(
                      onPressed: _userNameController.clear,
                      icon: Icon(Icons.close),
                    ),
            ),
            SizedBox(height: LayoutTokens.md),

            AppTextInput(
              onChanged: (value) => setState(() {
                password = value;
              }),
              onSubmitted: (value) => setState(() {
                password = value;
              }),
              errorText: passwordError,
              obscureText: isPasswordVisible,
              prefixIcon: Icon(Icons.lock),
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              label: "Password",
              hintText: "••••••••",
              keyboardType: TextInputType.emailAddress,
              isLarge: true,
              state: TextInputState.typing,
              suffixIcon: IconButton(
                icon: isPasswordVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () => setState(() {
                  isPasswordVisible = !isPasswordVisible;
                }),
              ),
            ),
            SizedBox(height: LayoutTokens.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                  activeColor: AppColors.primaryColor,
                  checkColor: AppColors.white,
                ),
                Text(
                  "Agree with terms and privacy",
                  style: AppTextStyles.paragraph4Regular.copyWith(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: LayoutTokens.xl),
            AppButton(
              size: ButtonSize.large,
              variant: ButtonVariant.primary,
              //height: 62,
              label: "Signup",
              onPressed: () {
                validate();
              },
            ),
            SizedBox(height: LayoutTokens.lg),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Or ?",
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: LayoutTokens.md),
            Center(child: SocialsAuthWidgets()),
            SizedBox(height: LayoutTokens.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have account ?",
                  style: AppTextStyles.paragraph4Regular.copyWith(fontSize: 17),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    " Sign in",
                    style: AppTextStyles.paragraph4Regular.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
