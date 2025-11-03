import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EpisodeLIst extends StatelessWidget {
  const EpisodeLIst({
    super.key,
    required this.imagePath,
    required this.chapterName,
    required this.releaseDate,
    required this.isSelected,
  });

  final String imagePath;
  final String chapterName;
  final String releaseDate;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: isSelected == true
            ? ColorManager.containerColor
            : ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(40),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              bottomLeft: Radius.circular(8.r),
            ),
            child: Image.asset(
              imagePath,
              width: 144.w,
              height: 104.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapterName,
                    style: getRegularStyle16(color: ColorManager.titleText3),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    releaseDate,
                    style: getLightStyle14(
                      color: ColorManager.textSecondary,
                      fontWeight: FontWeightManager.regular400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}