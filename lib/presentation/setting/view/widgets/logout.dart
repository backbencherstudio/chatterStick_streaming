import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/route/route_name.dart';


void onLogoutTap(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: ColorManager.whiteColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (_) {
      final style = Theme.of(context).textTheme;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: ColorManager.containerColor,
                shape: BoxShape.circle,
              ),
              child: Container(
                // padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: ColorManager.errorColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.logout,size: 24.h,color: ColorManager.whiteColor,),
                ),
              ),
            ),

            SizedBox(height: 16.h),
            Text(
              'Are you sure want to logout?',
              textAlign: TextAlign.center,
              style: style.titleSmall?.copyWith(
                color: ColorManager.titleText,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'You will need to login again to access your account',
              textAlign: TextAlign.center,
              style: style.bodySmall?.copyWith(
                color: ColorManager.mediumText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    title: "Cancle",
                    containerColor: ColorManager.containerColor,
                    //borderColor: ColorManager.borderColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    textStyle: style.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.titleText,
                      fontSize: 16.sp,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: PrimaryButton(
                      title: "Logout",
                      containerColor: ColorManager.errorColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      textStyle: style.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: ColorManager.whiteColor,
                        fontSize: 16.sp,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, RouteName.loginScreen);
                      }),
                ),
              ],
            ),
            SizedBox(
              width: 32.h,
            ),
          ],
        ),
      );
    },
  );
}

