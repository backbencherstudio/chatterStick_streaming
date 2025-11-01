import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
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
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => Image.asset(
                  ImageManager.comic1Png,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconManager.previousSvg,
              height: 24.h,
              width: 24.h,
            ),
            label: "Prev",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconManager.book1Svg,
              height: 24.h,
              width: 24.h,
            ),
            label: "Episode",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconManager.favouriteNav,
              height: 24.h,
              width: 24.h,
            ),
            label: "favorite",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              IconManager.nextSvg,
              height: 24.h,
              width: 24.h,
            ),
            label: "Next",
          ),
        ],
      ),
    );
  }
}
