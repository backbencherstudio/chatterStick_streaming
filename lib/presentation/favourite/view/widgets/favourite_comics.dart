import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constansts/app_colors.dart';
import '../../../../core/constansts/app_icons.dart';

class FavouriteComics extends StatelessWidget {
  const FavouriteComics({
    super.key,
    required this.image,
    required this.title,
    required this.episode,
    this.details,
  });
  final String image;
  final String title;
  final String episode;
  final String? details;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: EdgeInsets.all(12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(image, width: 124.w, fit: BoxFit.cover),
              Positioned(
                bottom: 12.h,
                right: 12.w,
                child: Image.asset(
                  AppIcons.favoritePng,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          // 👇 Use Expanded so text area takes remaining space automatically
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: style.titleSmall?.copyWith(
                    color: AppColors.titleText,
                    fontWeight: FontWeight.w500,
                      fontSize: 18.sp
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  episode,
                  style: style.bodyMedium?.copyWith(
                    color: AppColors.subtitleText,
                    fontWeight: FontWeight.w400,
                      fontSize: 16.sp
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  details ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: style.bodyMedium?.copyWith(
                    color: AppColors.subtitleText,
                    fontWeight: FontWeight.w400,
                      fontSize: 16.sp
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}