import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'Daniel Jones';
    _emailController.text = 'example@gmail.com';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: getRegularStyle16(
                        color: ColorManager.subtitleText1,
                        fontWeight: FontWeightManager.medium500,
                      ),
                    ),
                  ),
                  Text(
                    'My Account',
                    style: getMediumStyle18(
                      color: ColorManager.mediumText,
                      fontWeight: FontWeightManager.bold700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Save',
                      style: getRegularStyle16(
                        color: ColorManager.borderColor1,
                        fontWeight: FontWeightManager.medium500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.h,
                      decoration: BoxDecoration(
                        color: ColorManager.containerColor2,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        ImageManager.profilePng,
                        height: 120.h,
                        width: 120.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      right: -10,
                      bottom: -10,
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
                                color: ColorManager.containerColor2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              TextFormField(
                style: getRegularStyle16(color: ColorManager.mediumText),
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: getRegularStyle16(color: ColorManager.hintText),
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                style: getRegularStyle16(color: ColorManager.mediumText),
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: getRegularStyle16(color: ColorManager.hintText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
