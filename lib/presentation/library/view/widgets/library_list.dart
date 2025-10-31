import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constansts/app_colors.dart';
import '../../../../core/constansts/app_icons.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({
    super.key,
    required this.image,
    required this.title,
    required this.episode,
    required this.date,
    required this.details,
    required this.onTap,
    required this.isDownload,
  });

  final bool isDownload;
  final String image;
  final String title;
  final String episode;
  final String date;
  final String details;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onLongPress: () {
        onTap();
        // print('long press');
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: ColorManager.borderColor),
        ),
        padding: EdgeInsets.all(12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isDownload == true)
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: SvgPicture.asset(
                  AppIcons.checkmarkSvg,
                  width: 24.w,
                  height: 24.h,
                ),
              ),

            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.asset(
                image,
                width: 100.w,
                height: 173.h,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 10.w),
            // 👇 Use Expanded so text area takes remaining space automatically
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: style.titleSmall?.copyWith(
                      color: ColorManager.titleText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        episode,
                        style: style.bodyMedium?.copyWith(
                          color: ColorManager.subtitleText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        date,
                        style: style.bodyMedium?.copyWith(
                          color: ColorManager.subtitleText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    details,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: style.bodyMedium?.copyWith(
                      color: ColorManager.subtitleText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorManager.borderColor1),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 16.w,
                      ),
                      child: Text(
                        'Download',
                        style: style.bodyMedium?.copyWith(
                          color: ColorManager.buttonText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
