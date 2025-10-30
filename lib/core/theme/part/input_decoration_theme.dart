import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AppInputDecorationTheme {

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      hintStyle: TextStyle(
        color: AppColors.hintText,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
        errorStyle: TextStyle(
      color: AppColors.errorColor,     // Change error text color
      fontSize: 12,           // Change font size
      // Make it bold
    ),


      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        // borderSide: BorderSide(color: AppColors.borderColor,),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: AppColors.borderColor,width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        // borderSide: BorderSide(color: AppColors.borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
         borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
         borderSide: BorderSide(color: AppColors.borderColor),
      ),

      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        // borderSide: BorderSide(color: AppColors.borderColor,),
      ),

      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      filled: true,
      fillColor: AppColors.fillColor,
      focusColor: AppColors.primary,
      hoverColor: AppColors.primary,

  );
}
