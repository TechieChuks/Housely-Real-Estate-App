import 'package:flutter/material.dart';
import 'package:housely/core/constants/app_colors.dart';
import 'package:housely/core/constants/app_text_styles.dart';
import 'package:housely/core/enums/enums.dart';

import 'package:housely/core/utils/layout.dart';
import 'package:housely/core/widgets/app_button.dart';
import 'package:housely/core/widgets/app_textfields.dart';
import 'package:intl/intl.dart';
import 'package:housely/core/widgets/profile_picture.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? _selectedDate;

  Future _selectDate(BuildContext context) async =>
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(3050),
      ).then((DateTime? selected) {
        if (selected != null && selected != _selectedDate) {
          setState(() => _selectedDate = selected);
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Edit Profile",
            style: AppTextStyles.paragraph1SemiBold.copyWith(
              fontSize: 25,
              color: AppColors.grayNeutral[800],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 40),
              Center(child: ProfilePicture()),
              SizedBox(height: LayoutTokens.xxl),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                AppTextInput(
                  label: "Full name",
                  hintText: "Chukwuemeka Augustine Anoliefo",
                ),
                SizedBox(height: LayoutTokens.lg),
                AppTextInput(label: "Username", hintText: "TechieChuks"),
                SizedBox(height: LayoutTokens.lg),
                AppTextInput(
                  label: "Email",
                  hintText: "chuksanoliefo@gmail.com",
                ),

                // AppTextInput(
                //   state: TextInputState.pressed,
                //   label: "Date of birth",
                //   hintText: "November/21/1992",
                //   suffixIcon: GestureDetector(
                //     onTap: () => Navigator.pushNamed(context, "/login"),
                //     child: Icon(Icons.calendar_month),
                //   ),
                // ),
                SizedBox(height: LayoutTokens.lg),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of birth",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: LayoutTokens.sm),
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 72,

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                _selectedDate != null
                                    ? DateFormat(
                                        'MMMM d, yyyy',
                                      ).format(_selectedDate!)
                                    : DateFormat(
                                        'MMMM d, yyyy',
                                      ).format(DateTime.now()),
                                style: AppTextStyles.paragraph1Regular,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Icon(Icons.calendar_month),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: LayoutTokens.xxxl),
                AppButton(
                  size: ButtonSize.large,
                  label: "Save Change",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
