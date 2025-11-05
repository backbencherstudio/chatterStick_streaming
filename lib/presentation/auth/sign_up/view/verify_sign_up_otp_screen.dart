import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/values_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../viewmodel/verify_sign_up_otp_viewmodel.dart';

class VerifySignUpOtpScreen extends ConsumerStatefulWidget {
  const VerifySignUpOtpScreen({super.key, required this.email});

  final String email;
  @override
  ConsumerState<VerifySignUpOtpScreen> createState() =>
      _VerifySignUpOtpScreenState();
}

class _VerifySignUpOtpScreenState extends ConsumerState<VerifySignUpOtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  String otpValue = "";

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
                      style: style.bodyMedium?.copyWith(
                        color: ColorManager.mediumText,
                        fontWeight: FontWeight.w500,
                      ),
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
                        "Verify your new account",
                        style: getBoldStyle32(
                          color: ColorManager.mediumText,
                          fontWeight: FontWeightManager.semiBold600,
                          fontSize: FontSize.s28,
                        ),
                      ),
                      SizedBox(height: 12.h),

                      Text(
                        "Enter the verification code sent to your\nemail ${widget.email}",
                        style: getRegularStyle16(
                          color: ColorManager.subtitleText1,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // OTP Input using PinCodeTextField
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: _otpController,
                        obscureText: false,
                        animationType: AnimationType.scale,
                        keyboardType: TextInputType.number,
                        cursorColor: ColorManager.primary,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: ColorManager.titleText,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length != 6) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8.r),
                          borderWidth: 1,
                          inactiveColor: ColorManager.borderColor,
                          selectedColor: ColorManager.primary,
                          activeColor: ColorManager.titleText,
                          inactiveFillColor: ColorManager.whiteColor,
                          selectedFillColor: ColorManager.whiteColor,
                          activeFillColor: ColorManager.whiteColor,
                        ),
                        enableActiveFill: true,
                        animationDuration: const Duration(milliseconds: 200),
                        onChanged: (value) {
                          setState(() {
                            otpValue = value;
                          });
                        },
                        onCompleted: (value) {},
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: AppSize.s4,
                        children: [
                          Text(
                            'Didn’t received the code?',
                            style: getRegularStyle16(
                              color: ColorManager.subtitleText1,
                              fontWeight: FontWeightManager.regular400,
                            ),
                          ),
                          Text(
                            '02:00',
                            style: getRegularStyle16(
                              color: ColorManager.subtitleText1,
                              fontWeight: FontWeightManager.regular400,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Resent',
                              style: getRegularStyle16(
                                color: ColorManager.subtitleText2,
                                fontWeight: FontWeightManager.regular400,
                              ),
                            ),
                          ),
                        ],
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
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final res = await ref
                                .read(verifySignUpOtpProvider.notifier)
                                .emailVerify(
                                  otp: _otpController.text.trim(),
                                  email: widget.email,
                                );

                            if (res) {
                              Navigator.pushNamed(
                                context,
                                RouteName.loginScreen,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Invalid OTP')),
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
