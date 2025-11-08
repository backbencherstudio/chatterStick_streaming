import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resource/constansts/color_manger.dart';
import '../../../../core/resource/utils.dart';

void showShareBottomSheet(BuildContext context, String link) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Share",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.titleText,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Share on Social Media
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.share, color: ColorManager.primary, size: 28.sp),
                      onPressed: () {
                        Share.share(link, subject: "Check this out!");
                        Navigator.pop(context);
                      },
                    ),
                    Text("Share", style: TextStyle(fontSize: 12.sp, color: ColorManager.subtitleText1)),
                  ],
                ),
                // Copy Link
                Column(
                  children: [
                    IconButton(
                      icon: Icon(Icons.link, color: ColorManager.primary, size: 28.sp),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: link));
                        Utils.showToast(
                          message: 'Link copied to clipboard',
                          backgroundColor: ColorManager.primary,
                          textColor: ColorManager.whiteColor,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    Text("Copy Link", style: TextStyle(fontSize: 12.sp, color: ColorManager.subtitleText1)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      );
    },
  );
}
