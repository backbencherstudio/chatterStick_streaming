import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiddleBackHeader extends StatelessWidget {
  const MiddleBackHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
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
                  style: getRegularStyle16(
                    color: ColorManager.mediumText,
                    fontWeight: FontWeightManager.medium500,
                  ),
                ),
              ],
            ),
          ),
        ),

        Text(
          title,
          textAlign: TextAlign.center,
          style: getRegularStyle16(
            color: ColorManager.titleText,
            fontWeight: FontWeightManager.medium500,
          ),
        ),
      ],
    );
  }
}
