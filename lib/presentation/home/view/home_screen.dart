
import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:chatterstick_streaming_app/core/constansts/app_icons.dart';
import 'package:chatterstick_streaming_app/core/constansts/app_images.dart';
import 'package:chatterstick_streaming_app/data/models/comics_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/models/favourite_comics_model.dart';
import '../../../data/models/library_item_model.dart';


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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover',
                    style: style.titleSmall?.copyWith(
                      color: AppColors.titleText,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp
                    ),
                  ),
                  SvgPicture.asset(
                    AppIcons.notificationSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),
              SizedBox(height: 24.h),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: 'Start typing',
                      //     hintStyle: style.titleSmall?.copyWith(
                      //       color: AppColors.hintText,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //     suffixIcon: Icon(Icons.search,size: 24.h,color: AppColors.hintText,)
                      //   ),
                      // )

                      ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(AppImages.bannerPng,width: double.infinity,fit: BoxFit.cover,)),

                      SizedBox(height: 24.h),


                      // Recommendation widgets
                      Text('Recommendation',style: style.bodyLarge?.copyWith(
                        color: AppColors.titleText,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp
                      ),),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 290.h,
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

                      SizedBox(height: 22.h),
                      Text('Last Read',style: style.bodyLarge?.copyWith(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp
                      ),),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 290.h,
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

                      SizedBox(height: 22.h),
                      Text('Popular',style: style.bodyLarge?.copyWith(
                          color: AppColors.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp
                      ),),
                      SizedBox(height: 16.h),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(), // disable scrolling if inside ScrollView
                        shrinkWrap: true,
                        itemCount: comics.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items horizontally
                          mainAxisSpacing: 0.h,
                          crossAxisSpacing: 13.w,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (context, index) {
                          final comic = comics[index];
                          return CustomComicBox(
                            image: comic.image,
                            title: comic.title,
                            subtitle: comic.subtitle,
                          );
                        },
                      )

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
            style: style.bodyMedium?.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: style.titleSmall?.copyWith(
              color: AppColors.subtitleText,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
