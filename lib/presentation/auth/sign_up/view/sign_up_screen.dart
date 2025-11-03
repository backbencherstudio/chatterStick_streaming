import 'dart:io';

import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../viewmodels/image_picker_provider.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
   final image = ref.watch(imagePickerProvider);
    final notifier = ref.read(imagePickerProvider.notifier);
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

              SizedBox(height: 16.h),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new account',
                      style: getBoldStyle32(color: ColorManager.mediumText),
                    ),
                    SizedBox(height: 16.h),
                    Center(
                      child: Stack(
                              children: [
                               image != null
                          ? Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              clipBehavior: Clip
                                  .antiAlias,
                              child: Image.file(
                                      File(image.path),
                                      fit: BoxFit.cover,
                                    )
                                  
                            )
                          :  Container(
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                    color: ColorManager.containerColor2,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    size: 42.h,
                                    color: ColorManager.whiteColor,
                                  ),
                                ),

                                Positioned(
                                  right: -10,
                                  bottom: -10,
                                  child: GestureDetector(
                                    onTap: () => notifier.pickImage(),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorManager.whiteColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorManager.containerColor3,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.w),
                                            child: Icon(
                                              Icons.camera_alt,
                                              size: 24.h,
                                              color:
                                                  ColorManager.containerColor2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),

                    SizedBox(height: 16.h),

                    TextFormField(
                      style: getRegularStyle16(color: ColorManager.mediumText),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        hintStyle: getRegularStyle16(
                          color: ColorManager.mediumText,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      style: getRegularStyle16(color: ColorManager.mediumText),
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        hintStyle: getRegularStyle16(
                          color: ColorManager.mediumText,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    TextFormField(
                      style: getRegularStyle16(color: ColorManager.mediumText),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: getRegularStyle16(
                          color: ColorManager.mediumText,
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text(
                          'I agree to the Terms & Conditions',
                          style: getRegularStyle16(
                            color: ColorManager.subtitleText1,
                          ),
                        ),
                      ],
                    ),

                    Spacer(),
                    PrimaryButton(
                      title: 'Create Account',
                      width: double.infinity,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.verifyNewAccountOtpScreen,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getRegularStyle16(
                            color: ColorManager.subtitleText1,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.loginScreen);
                          },
                          child: Text(
                            'Login',
                            style: getRegularStyle16(
                              color: ColorManager.mediumText,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
