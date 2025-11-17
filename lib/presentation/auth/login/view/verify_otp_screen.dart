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

import '../../../../core/utils/utils.dart';
import '../../sign_up/viewmodel/verify_sign_up_otp_viewmodel.dart';
import '../viewmodel/forgot_password_viewmodel.dart';
import '../viewmodel/resent_otp_timer_provider.dart';

class VerifyOTPScreen extends ConsumerStatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});
  final String email;

  @override
  ConsumerState<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends ConsumerState<VerifyOTPScreen> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String otpValue = "";

  @override
  void initState() {
    super.initState();
    // Start the timer when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(resendOtpTimerProvider.notifier).start();
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  String _formatTimer(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final timerSeconds = ref.watch(resendOtpTimerProvider);
    final canResend = timerSeconds == 0;

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
                      // Title
                      Text(
                      "Forgot your password",
                      style: getBoldStyle32(color: ColorManager.mediumText),
                    ),
                    SizedBox(height: 12.h),

                    // Subtitle
                    Text(
                      "Enter the verification code sent to your\nemail ${widget.email}",
                      style: getMediumStyle18(
                        color: ColorManager.subtitleText1,
                      ),
                    ),
                    SizedBox(height: 32.h),

                    // OTP Input using PinCodeTextField
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      controller: _otpController,
                      animationType: AnimationType.scale,
                      keyboardType: TextInputType.number,
                      cursorColor: ColorManager.primary,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6) {
                          return 'Please enter a valid OTP';
                        } else {
                          return null;
                        }
                      },
                      textStyle: getMediumStyle18(
                          color: ColorManager.titleText,
                          fontWeight: FontWeightManager.bold700),
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
                        otpValue = value;
                      },
                      onCompleted: (value) {},
                    ),
                    SizedBox(height: 16.h),

                    // Timer and Resend Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSize.s4,
                      children: [
                    Text(
                    "Didn't receive the code? ",
                    style: getRegularStyle16(
                    color: ColorManager.subtitleText1,
                      fontWeight: FontWeightManager.regular400,
                    ),
                  ),
                  if (!canResend)
              Text(
                _formatTimer(timerSeconds),
                style: getRegularStyle16(
                  color: ColorManager.subtitleText1,
                  fontWeight: FontWeightManager.regular400,
                ),
              ),
              GestureDetector(
                onTap: canResend
                    ? () async {
                  final res = await ref
                      .read(forgotPasswordProvider.notifier)
                      .forgotPassword(
                    email: widget.email,
                  );

                  if (res) {
                    ref
                        .read(resendOtpTimerProvider.notifier)
                        .start();
                  } else {
                    Utils.showErrorToast(
                        message: "Failed to resend OTP");
                  }
                }
                    : null,
                child: Text(
                  'Resend',
                  style: getRegularStyle16(
                    color: canResend
                        ? ColorManager.primary
                        : ColorManager.subtitleText2,
                    fontWeight: FontWeightManager.regular400,
                  ),
                ),
              )
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
                    .verifyToken(
                  token: _otpController.text.trim(),
                  email: widget.email,
                );

                if (res) {
                  Navigator.pushNamed(
                    context,
                    RouteName.createNewPasswordScreen,
                    arguments: [
                      widget.email,
                      _otpController.text.trim(),
                    ]
                  );
                } else {
                  Utils.showErrorToast(message: "Invalid OTP");
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
