import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/constansts/icon_manager.dart';

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
        color: isRead ? ColorManager.whiteColor : ColorManager.containerColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isRead
                    ? ColorManager.containerColor
                    : ColorManager.containerColor1,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  IconManager.notificationSvg,
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
                      color: ColorManager.titleText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: style.labelMedium?.copyWith(
                      color: ColorManager.subtitleText,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  Text(
                    timeAgo,
                    style: style.labelMedium?.copyWith(
                      color: ColorManager.mediumText,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
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
