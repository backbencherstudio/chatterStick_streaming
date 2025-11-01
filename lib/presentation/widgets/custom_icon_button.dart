import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.title,
    required this.image,
    this.containerColor,
    this.textColor,
    this.iconColor,
    this.borderColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding, required this.onTap,
  });

  final String title;
  final String image;
  final Color? containerColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Padding? padding;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: containerColor ?? ColorManager.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
          border: Border.all(color: borderColor ?? ColorManager.primary),
        ),
        child:
            padding ??
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                children: [
                  SvgPicture.asset(image, height: 18.h, width: 18.h),
                  SizedBox(width: 5.w),
                  Text(
                    title,
                    style: getLightStyle14(
                      color: textColor ?? ColorManager.whiteColor,
                      fontWeight: FontWeightManager.medium500,
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
