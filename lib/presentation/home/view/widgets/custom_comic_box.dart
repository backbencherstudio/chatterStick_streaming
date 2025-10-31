import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resource/constansts/color_manger.dart';

class CustomComicBox extends StatelessWidget {
  const CustomComicBox({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return SizedBox(
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              image,
              height: 214.h,
              width: 160.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: style.bodySmall?.copyWith(
              color: ColorsManager.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: style.labelMedium?.copyWith(
              color: ColorsManager.subtitleText,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
