import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/data/models/comics_model.dart';
import 'package:chatterstick_streaming_app/presentation/home/view/widgets/custom_comic_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_header.dart';
import '../viewmodel/home_screen_viewmodel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeProvider);

    final style = Theme.of(context).textTheme;
    return Scaffold(
      body:homeData.isLoading?Center(child:CircularProgressIndicator() ,): Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SafeArea(
          child: Column(
            children: [
              CustomHeader(title: 'Discover'),
              SizedBox(height: 24.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        style: getRegularStyle16(
                          color: ColorManager.mediumText,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: getRegularStyle16(
                            color: ColorManager.hintText,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            child: SvgPicture.asset(
                              IconManager.searchSvg,
                              height: 18.h,
                              width: 18.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),

                      // Banner widgets
                     homeData.bannerData.isNotEmpty? ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                  homeData.bannerData[0].thumbnail??'',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ):SizedBox(),

                      SizedBox(height: 24.h),

                      // Recommendation widgets
                      Text(
                        'Recommendation',
                        style: style.bodyLarge?.copyWith(
                          color: ColorManager.titleText,
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
                          itemCount: homeData.recomandationData.length,
                          itemBuilder: (context, index) {
                            final comic = homeData.recomandationData[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.comicDetailsScreen,
                                  );
                                },
                                child: CustomComicBox(
                                  image: comic.thumbnail??"",
                                  title: comic.title??'N/A',
                                  subtitle: comic.author??"N/A",
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        'Last Read',
                        style: style.bodyLarge?.copyWith(
                          color: ColorManager.titleText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        height: 285.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeData.lastReadData.length,
                          itemBuilder: (context, index) {
                            final comic = homeData.lastReadData[index];
                            return Padding(
                              padding: EdgeInsets.only(right: 13.w),
                              child: CustomComicBox(
                                image: comic.thumbnail??'',
                                title: comic.title??"N/A",
                                subtitle: comic.title??"N/A",
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),
                      Text(
                        'Popular',
                        style: style.bodyLarge?.copyWith(
                          color: ColorManager.titleText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:homeData.popularData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 items horizontally
                          mainAxisSpacing: 0.h,
                          crossAxisSpacing: 13.w,
                          childAspectRatio: 0.58,
                        ),
                        itemBuilder: (context, index) {
                          final comic = homeData.popularData[index];
                          return CustomComicBox(
                            image: comic.thumbnail??'',
                            title: comic.title??"N/A",
                            subtitle: comic.author??"N/A",
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
