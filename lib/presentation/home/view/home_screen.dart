
import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:chatterstick_streaming_app/core/constansts/app_icons.dart';
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
                    ),
                  ),
                  SvgPicture.asset(
                    AppIcons.notificationSvg,
                    width: 24.w,
                    height: 24.h,
                  ),
                ],
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
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

                      // Recommendation widgets
                      SizedBox(
                        height: 300.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: comics.length,
                          itemBuilder: (context, index) {
                            final comic = comics[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 13),
                              child: CustomComicBox(
                                image: comic.image,
                                title: comic.title,
                                subtitle: comic.subtitle,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Favourites widgets
                      ...List.generate(favouriteComics.length, (index) {
                        final favourite = favouriteComics[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: FavouriteComics(
                            image: favourite.image,
                            episode: favourite.episode,
                            details: favourite.details,
                          ),
                        );
                      }),

                      SizedBox(height: 20.h),

                      ...List.generate(libraryItems.length, (index) {
                        final items = libraryItems[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child:   LibraryList(
                            image: items.image,
                            title:  items.title,
                            episode: items.episode,
                            date: items.date,
                            details: items.details,
                            onTap: items.onTap,
                            isDownload: items.isDownload,
                          ),
                        );
                      }),
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
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        padding: EdgeInsets.all(12.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          if(isDownload == true)  Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: SvgPicture.asset(AppIcons.checkmarkSvg, width: 24.w, height: 24.h),
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
                      color: AppColors.titleText,
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
                          color: AppColors.subtitleText,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Text(
                        date,
                        style: style.bodyMedium?.copyWith(
                          color: AppColors.subtitleText,
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
                      color: AppColors.subtitleText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderColor1),
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
                          color: AppColors.buttonText,
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

class FavouriteComics extends StatelessWidget {
  const FavouriteComics({
    super.key,
    required this.image,
    required this.episode,
    this.details,
  });
  final String image;
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
                  episode,
                  style: style.titleSmall?.copyWith(
                    color: AppColors.titleText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  episode,
                  style: style.bodyMedium?.copyWith(
                    color: AppColors.subtitleText,
                    fontWeight: FontWeight.w400,
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
