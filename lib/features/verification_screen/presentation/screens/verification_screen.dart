import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';
import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/features/verification_screen/data/otp_controller.dart';
import 'package:housely/features/verification_screen/presentation/widget/otp_view.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late OtpController controller;

  final otpControllers = List.generate(4, (_) => TextEditingController());
  final focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    controller = OtpController(() => setState(() {}));
  }

  @override
  void dispose() {
    controller.dispose();
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify your Email",
              style: AppTextStyles.heading5SemiBold.copyWith(fontSize: 27),
            ),
            Text(
              "Please enter 6 digit verification that have \nbeen sent to your email address",
              style: AppTextStyles.paragraph4Regular.copyWith(
                fontSize: 20,
                color: AppColors.grayNeutral[400],
              ),
            ),
            SizedBox(height: LayoutTokens.xxl),

            /// OTP INPUTS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return OtpInputBox(
                  controller: otpControllers[index],
                  focusNode: focusNodes[index],
                  onChanged: (value) {
                    controller.updateOtp(index, value);

                    if (value.isNotEmpty && index < 3) {
                      focusNodes[index + 1].requestFocus();
                    }

                    if (index == 3 && value.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                    }
                  },
                );
              }),
            ),

            const SizedBox(height: LayoutTokens.xxl),
            Center(
              child: Text(
                "Don’t receive code ?",
                style: AppTextStyles.paragraph4Regular.copyWith(
                  fontSize: 20,
                  color: AppColors.grayNeutral[800],
                ),
              ),
            ),

            /// TIMER / RESEND
            Center(
              child: state.canResend
                  ? InkWell(
                      onTap: controller.resendCode,
                      child: Text(
                        'Resend Code',
                        style: AppTextStyles.paragraph4Regular.copyWith(
                          color: AppColors.error[800],
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Text(
                      'Resend in ${state.secondsRemaining}s',
                      style: AppTextStyles.paragraph4Regular.copyWith(
                        fontSize: 18,
                      ),
                    ),
            ),

            SizedBox(height: LayoutTokens.xxl),

            /// SEND BUTTON
            SizedBox(
              width: double.infinity,
              child: AppButton(
                size: ButtonSize.large,
                variant: ButtonVariant.primary,
                //height: 62,
                label: "Verify",
                onPressed: () {
                  Navigator.pushNamed(context, "/search_location");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
