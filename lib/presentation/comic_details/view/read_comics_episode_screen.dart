import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/data/models/episode_model.dart';
import 'package:chatterstick_streaming_app/presentation/comic_details/view/widgets/episode_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReadComicsEpisodeScreen extends StatefulWidget {
  const ReadComicsEpisodeScreen({super.key});

  @override
  State<ReadComicsEpisodeScreen> createState() =>
      _ReadComicsEpisodeScreenState();
}

class _ReadComicsEpisodeScreenState extends State<ReadComicsEpisodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 18.h,
                      color: ColorManager.iconColor,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'They Say I Am An Elven Princess Ch 1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle18(
                        color: ColorManager.titleText3,
                        fontWeight: FontWeightManager.bold700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: episodes.length,
                itemBuilder: (context, index){
                  final episode = episodes[index];
                  return Image.asset(
                    episode.imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.previousSvg,
                            height: 24.h,
                            width: 24.h,
                          ),
                          Text('Prev'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _showBottomSheet(context);
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.book1Svg,
                            height: 24.h,
                            width: 24.h,
                          ),
                          Text('Episode'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.favouriteNav,
                            height: 24.h,
                            width: 24.h,
                          ),
                          Text('favorite'),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            IconManager.nextSvg,
                            height: 24.h,
                            width: 24.h,
                          ),
                          Text('Next'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.65,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80.w,
                        height: 5.h,
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),

                    Text(
                      '88 Episode',
                      style: getMediumStyle18(
                        color: ColorManager.blackColor,
                        fontWeight: FontWeightManager.semiBold600,
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.zero,
                        itemCount: episodes.length,
                        itemBuilder: (context, index) {
                          final episode = episodes[index];
                          return EpisodeLIst(
                            imagePath: episode.imagePath,
                            chapterName: episode.chapterName,
                            releaseDate: episode.releaseDate,
                            isSelected: episode.isSelected,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
