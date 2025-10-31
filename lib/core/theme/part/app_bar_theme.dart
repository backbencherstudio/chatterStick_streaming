import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: ColorManager.primary,
    actionsPadding: EdgeInsets.all(10),
    titleTextStyle: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: ColorManager.primary,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
