import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/constansts/icon_manager.dart';
import '../../../../core/resource/constansts/image_manager.dart';
import '../../../../data/models/favourite_comics_model.dart';

class FavouriteComics extends StatelessWidget {
  const FavouriteComics({super.key, required this.item});
  final FavoriteComicModel item;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.borderColor),
      ),
      padding: EdgeInsets.all(12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                item.details!.thumbnail ?? '',
                width: 124.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    ImageManager.imgBreakPng,
                    width: 124.w,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Positioned(
                bottom: 12.h,
                right: 12.w,
                child: Image.asset(
                  IconManager.favoritePng,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.details!.title ?? 'N/A',
                  style: style.titleSmall?.copyWith(
                    color: ColorManager.titleText,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  item.details!.cCount!.episodes.toString(),
                  style: style.bodyMedium?.copyWith(
                    color: ColorManager.subtitleText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  item.details!.author ?? '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: style.bodyMedium?.copyWith(
                    color: ColorManager.subtitleText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
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
