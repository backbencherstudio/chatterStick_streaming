import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';




class AppEvaluatedButtonThemes {
  AppEvaluatedButtonThemes._();

  //Light mode Evaluated Button Theme
  static final evaluatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      foregroundColor: AppColors.primary,
      backgroundColor: AppColors.primary,
      textStyle: GoogleFonts.roboto(
        textStyle: TextStyle(fontSize: 18.sp),
        color: AppColors.whiteColor,
      ),

      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
    ),
  );
}
