import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/utils.dart';
import 'package:chatterstick_streaming_app/core/resource/values_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/comic_details/view/widgets/share_bottomsheet.dart';
import 'package:chatterstick_streaming_app/presentation/home/view/widgets/custom_comic_box.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class ComicDetailsScreen extends StatefulWidget {
  const ComicDetailsScreen({super.key});

  @override
  State<ComicDetailsScreen> createState() => _ComicDetailsScreenState();
}

class _ComicDetailsScreenState extends State<ComicDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    ImageManager.recoComics,
                    width: double.infinity,
                    height: 190.h,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 10.h,
                    left: 10.w,
                    right: 10.w,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Share.share('Check this out');
                                },
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                              // SizedBox(width: 4.w),
                              IconButton(
                                onPressed: () {
                                  Utils.showToast(
                                    message: 'Successfully Downloaded',
                                    backgroundColor: ColorManager.primary,
                                    textColor: ColorManager.whiteColor,
                                  );
                                },
                                icon: Icon(
                                  Icons.save_alt_outlined,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Text(
                          'They Say I Am An Elven Princess',
                          style: getMediumStyle18(
                            color: ColorManager.titleText3,
                            fontWeight: FontWeightManager.bold700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Author',
                          style: getLightStyle14(
                            color: ColorManager.subtitleText,
                            fontSize: AppSize.s14,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            CustomIconButton(
                              title: 'Read Ch. 1',
                              onTap: () {},
                              image: IconManager.bookSvg,
                            ),
                            SizedBox(width: 10.w),
                            CustomIconButton(
                              title: 'favorite',
                              onTap: () {},
                              containerColor: ColorManager.whiteColor,
                              textColor: ColorManager.primary,
                              iconColor: ColorManager.primary,
                              borderColor: ColorManager.primary,
                              image: IconManager.favouriteNav,
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(height: 2.h),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'On Going',
                          style: getMediumStyle18(
                            color: ColorManager.titleText3,
                            fontWeight: FontWeightManager.bold700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas. Class aptent taciti sociosqu ad litora torquent',
                          style: getRegularStyle16(
                            color: ColorManager.subtitleText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(height: 2.h),
                  ),
                  SizedBox(height: 20.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0.h,
                        crossAxisSpacing: 13.w,
                        childAspectRatio: 0.56,
                      ),
                      itemBuilder: (context, index) {
                        // final comic = comics[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.readComicsEpisodeScreen,
                            );
                          },
                          child: CustomComicBox(
                            image: ImageManager.recoComics,
                            height: 133.h,
                            title: 'Eps 01',
                            subtitle: '2025-08-01 08:20',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
