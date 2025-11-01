import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/route/route_name.dart';
import '../../../widgets/primery_button.dart';




class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.h,
                      color: ColorManager.mediumText,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      'Back',
                      style: getRegularStyle16(color: ColorManager.mediumText),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.h),

                      // Title
                      Text(
                        "Create a new password",
                        style: getBoldStyle32(color: ColorManager.mediumText),
                      ),
                      SizedBox(height: 12.h),

                      // Subtitle
                      Text(
                        "Enter a new password and try not to forget it.",
                        style: getRegularStyle16(
                          color: ColorManager.subtitleText1,
                        ),
                      ),
                      SizedBox(height: 32.h),

                      // New Password screen
                      TextFormField(
                        style: getRegularStyle16(color: ColorManager.mediumText),
                        controller: _passwordController,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "New Password",
                          hintStyle: getRegularStyle16(color: ColorManager.hintText),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            size: 24.h,
                            color: ColorManager.iconColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Please enter your password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Confirm New Password screen
                      TextFormField(
                        style: getRegularStyle16(color: ColorManager.mediumText),
                        controller: _confirmPasswordController,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Re-enter the new Password",
                          hintStyle: getRegularStyle16(color: ColorManager.hintText),
                          suffixIcon: Icon(
                            Icons.visibility_off_outlined,
                            size: 24.h,
                            color: ColorManager.iconColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Please enter your password';
                          } else {
                            return null;
                          }
                        },
                      ),

                      Spacer(),
                      // Continue Button
                      PrimaryButton(
                        title: "Continue",
                        width: double.infinity,
                        containerColor: ColorManager.primary,
                        textStyle: getRegularStyle16(
                          color: ColorManager.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(
                              context,
                              RouteName.loginScreen,
                            );
                          }
                        },
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
