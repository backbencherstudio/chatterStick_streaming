import 'dart:developer';
import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

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
                          style: getBoldStyle32(color: ColorManager.mediumText)
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Please enter your email address to reset\nyour password.",
                        style: getMediumStyle18(color: ColorManager.subtitleText1),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: style.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorManager.subtitleText,
                        ),
                        decoration: InputDecoration(
                          hintText: "Email",
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
                        textStyle: getMediumStyle18(color: ColorManager.whiteColor),
                        onTap: () {
                          log(_emailController.text);
                          Navigator.pushNamed(context, RouteName.verifyOTPScreen);
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamed(context, RouteName.verifyOTPScreen);

                            // context.push(RouteName.verifyEmail);
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



