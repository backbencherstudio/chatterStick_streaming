
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTextTheme {
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.roboto(
      fontSize: 32.sp,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),

    bodyLarge: GoogleFonts.roboto(
      fontSize: 18.sp,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),

    labelLarge: GoogleFonts.roboto(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.roboto(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
    ),
  );
}
