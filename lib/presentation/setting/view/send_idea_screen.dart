import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/custom_header.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendIdeaScreen extends StatefulWidget {
  const SendIdeaScreen({super.key});

  @override
  State<SendIdeaScreen> createState() => _SendIdeaScreenState();
}

class _SendIdeaScreenState extends State<SendIdeaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              const CustomHeader(title: 'Drop Your Idea!'),
              SizedBox(height: 24.h),
              Text(
                maxLines: 4,
                "Got a hilarious plot, a witty one-liner, or a deep thought for a stick-figure comic? We're listening! Your idea could be the next Chattersticks hit",
                style: getRegularStyle16(color: ColorManager.mediumText1),
              ),
              SizedBox(height: 16.h),
              TextFormField(
                style: getRegularStyle16(color: ColorManager.mediumText),
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Example: The stick figure realizes his dog is made of 2 lines and a circle. Write your amazing comic idea here...',
                  hintStyle: getRegularStyle16(color: ColorManager.hintText),
                ),
              ),

              SizedBox(height: 24.h),
              PrimaryButton(title: 'Submit Idea',width: double.infinity, onTap: (){
                Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
