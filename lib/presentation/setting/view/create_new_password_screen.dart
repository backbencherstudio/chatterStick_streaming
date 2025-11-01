import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/middle_back_header.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeNewPasswordScreen extends StatefulWidget {
  const ChangeNewPasswordScreen({super.key});

  @override
  State<ChangeNewPasswordScreen> createState() =>
      _ChangeNewPasswordScreenState();
}

class _ChangeNewPasswordScreenState extends State<ChangeNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              MiddleBackHeader(title: 'New password'),
              SizedBox(height: 24.h),
              Text(
                "Enter first enter the current password and then your new password.",
                style: getRegularStyle16(color: ColorManager.subtitleText1),
              ),
              SizedBox(height: 20.h,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Current password',
                ),
              ),
              SizedBox(height: 12.h,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'New password',
                ),
              ),
              Spacer(),
              PrimaryButton(title: 'Create new password', onTap: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
