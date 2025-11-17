import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/constansts/icon_manager.dart';
import '../../viewmodel/select_tab_provider.dart';

class LibraryList extends ConsumerWidget {
  const LibraryList({
    super.key,
    required this.image,
    required this.title,
    required this.episode,
    required this.date,
    required this.details,
  });

  final String image;
  final String title;
  final String episode;
  final String date;
  final String details;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDownload = ref.watch(isDownloadProvider);
    final style = Theme.of(context).textTheme;
    return Container(
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
          if (isDownload == 'download')
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: SvgPicture.asset(
                IconManager.checkmarkSvg,
                width: 24.w,
                height: 24.h,
              ),
            ),

          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.network(
              image,
              width: 100.w,
              height: 173.h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                child: Image.asset(ImageManager.imgBreakPng,
                  width: 100.w,
                  height: 173.h,
                  fit: BoxFit.cover,),
              )
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
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: style.titleMedium?.copyWith(
                    color: ColorManager.titleText,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Eps ${episode}',
                        style: style.bodySmall?.copyWith(
                          color: ColorManager.subtitleText,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        date,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: style.bodySmall?.copyWith(
                          color: ColorManager.subtitleText,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  details,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: style.bodySmall?.copyWith(
                    color: ColorManager.subtitleText,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
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
                      style: style.bodySmall?.copyWith(
                        color: ColorManager.buttonText,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
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
