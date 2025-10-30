import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:chatterstick_streaming_app/core/constansts/app_icons.dart';
import 'package:chatterstick_streaming_app/core/constansts/app_images.dart';
import 'package:chatterstick_streaming_app/data/models/comics_model.dart';
import 'package:chatterstick_streaming_app/presentation/home/view/widgets/customComicBox.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_header.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              CustomHeader(title: 'Discover',),
              SizedBox(height: 24.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: style.titleSmall?.copyWith(
                            color: AppColors.hintText,
                            fontWeight: FontWeight.w400,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 8.w),
                            child: SvgPicture.asset(AppIcons.searchSvg,height: 18.h,width: 18.h,),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Banner widgets
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          AppImages.bannerPng,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Recommendation widgets
                      Text(
                        'Recommendation',
                        style: style.bodyLarge?.copyWith(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 285.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: comics.length,
                          itemBuilder: (context, index) {
                            final comic = comics[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: CustomComicBox(
                                image: comic.image,
                                title: comic.title,
                                subtitle: comic.subtitle,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        'Last Read',
                        style: style.bodyLarge?.copyWith(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 285.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: comics.length,
                          itemBuilder: (context, index) {
                            final comic = comics[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: CustomComicBox(
                                image: comic.image,
                                title: comic.title,
                                subtitle: comic.subtitle,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        'Popular',
                        style: style.bodyLarge?.copyWith(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: comics.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items horizontally
                          mainAxisSpacing: 0.h,
                          crossAxisSpacing: 13.w,
                          childAspectRatio: 0.56,
                        ),
                        itemBuilder: (context, index) {
                          final comic = comics[index];
                          return CustomComicBox(
                            image: comic.image,
                            title: comic.title,
                            subtitle: comic.subtitle,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


