import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/app_colors.dart';
import '../../../../core/constansts/app_icons.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    required this.title,
    required this.message,
    required this.timeAgo,
    required this.isRead,
  });

  final String title;
  final String message;
  final String timeAgo;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: isRead ?AppColors.whiteColor : AppColors.containerColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isRead ? AppColors.containerColor : AppColors.containerColor1,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  AppIcons.notificationSvg,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),

            SizedBox(width: 10.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: style.bodyMedium?.copyWith(
                      color: AppColors.titleText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                   message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: style.labelMedium?.copyWith(
                      color: AppColors.subtitleText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  Text(
                    timeAgo,
                    style: style.labelMedium?.copyWith(
                      color: AppColors.mediumText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
