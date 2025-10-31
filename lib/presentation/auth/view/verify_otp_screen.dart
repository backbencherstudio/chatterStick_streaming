import 'dart:developer';
import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/route/route_name.dart';
import '../../widgets/primery_button.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: style.headlineLarge?.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.mediumText,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        textAlign: TextAlign.center,
                        "Please enter your email address to reset\nyour password.",
                        style: style.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color:ColorsManager.subtitleText,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: style.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: ColorsManager.subtitleText,
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
                      SizedBox(height: 32.h),
                      Center(
                        child: PrimaryButton(
                          title: "Send OTP",
                          containerColor: ColorsManager.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 10.h,
                          ),
                          textStyle: style.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: ColorsManager.whiteColor,
                          ),
                          onTap: () {
                            log(emailController.text);
                            if (_formKey.currentState!.validate()) {

                              // context.push(RouteName.verifyEmail);
                            }
                          },
                        ),
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



