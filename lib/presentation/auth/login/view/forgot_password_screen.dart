import 'dart:developer';
import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/utils.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/forgot_password_viewmodel.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.sp,
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
                      Text(
                        "Forgot Password?",
                        style: getBoldStyle32(color: ColorManager.mediumText),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Please enter your email address to reset\nyour password.",
                        style: getMediumStyle18(
                          color: ColorManager.subtitleText1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: getRegularStyle16(
                          color: ColorManager.mediumText,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: getRegularStyle16(
                            color: ColorManager.hintText,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          if (!EmailValidator.validate(value)) {
                            return "Please enter a valid e-mail";
                          }
                          return null;
                        },
                      ),
                      Spacer(),
                      PrimaryButton(
                        title: "Continue",
                        width: double.infinity,
                        containerColor: ColorManager.primary,
                        textStyle: getMediumStyle18(
                          color: ColorManager.whiteColor,
                        ),
                        onTap: () async {
                          log(_emailController.text);
                          if (_formKey.currentState!.validate()) {
                            final res = await ref
                                .read(forgotPasswordProvider.notifier)
                                .forgotPassword(
                                  email: _emailController.text.trim(),
                                );
                            if (res) {
                              Navigator.pushNamed(
                                context,
                                RouteName.verifyOTPScreen,
                                arguments: _emailController.text.trim(),
                              );
                            } else {
                              Utils.showToast(
                                message: 'Something went wrong',
                                backgroundColor: ColorManager.errorColor,
                                textColor: ColorManager.whiteColor,
                              );
                            }
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
