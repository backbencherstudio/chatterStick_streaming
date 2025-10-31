import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/favourite_comics_model.dart';
import '../../widgets/custom_header.dart';
import 'widgets/favourite_comics.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const CustomHeader(title: 'Discover'),
              SizedBox(height: 24.h),

              Expanded(
                child: favouriteComics.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              IconManager.favouriteNav,
                              height: 72.h,
                              width: 72.w,
                              colorFilter: const ColorFilter.mode(
                                ColorsManager.errorColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'No Favorite',
                              style: styles.titleMedium!.copyWith(
                                color: ColorsManager.subtitleText,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(favouriteComics.length, (index) {
                              final favourite = favouriteComics[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 12.h),
                                child: FavouriteComics(
                                  image: favourite.image,
                                  title: favourite.title,
                                  episode: favourite.episode,
                                  details: favourite.details,
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
