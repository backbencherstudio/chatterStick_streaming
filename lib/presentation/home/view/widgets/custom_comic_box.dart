import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/resource/constansts/color_manger.dart';

class CustomComicBox extends StatelessWidget {
  const CustomComicBox({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.height,
    this.isSelected = false,
  });

  final String image;
  final String title;
  final String subtitle;
  final double? height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return SizedBox(
      width: 160.w,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  image,
                  height: height ?? 214.h,
                  width: 160.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      ImageManager.imgBreakPng,
                      height: height ?? 214.h,
                      width: 160.w,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: style.bodySmall?.copyWith(
                  color: ColorManager.blackColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: style.labelMedium?.copyWith(
                  color: ColorManager.subtitleText,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          isSelected
              ? Positioned(
                  child: SizedBox(
                    width: 160.w,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        IconManager.checkmarkSvg,
                        width: 24.h,
                        height: 24.h,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
