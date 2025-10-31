import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/values_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main color of the app====================
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primaryDark,
    primaryColorDark: ColorsManager.primary,
    disabledColor: ColorsManager.textSecondary,
    splashColor: ColorsManager.whiteColor,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorsManager.primaryDark,
      // Your accent color here
    ),
    //card view them=============================
    cardTheme: CardThemeData(
      color: ColorsManager.whiteColor,
      shadowColor: ColorsManager.subtitleText,
      elevation: AppSize.s4,
    ),
    //app bar theme======================
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorsManager.whiteColor,
      titleTextStyle: getRegularStyle(
        color: ColorsManager.whiteColor,
        fontSize: FontSize.s16,
      ),
    ),
    //Button theme======================
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),

      disabledColor: ColorsManager.textSecondary,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.primaryDark,
    ),
    //elevated buttom theme============
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
          color: ColorsManager.whiteColor,
          fontSize: FontSize.s16,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    //
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
        color: ColorsManager.whiteColor,
        fontSize: FontSize.s16,
      ),
      titleMedium: getMediunStyle(
        color: ColorsManager.whiteColor,
        fontSize: FontSize.s14,
      ),
      bodyLarge: getRegularStyle(  fontSize: FontSize.s16,color: ColorsManager.whiteColor),
    ),
    //text formfield decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),


      hintStyle: getMediunStyle(color: ColorsManager.hintText,fontSize: 16.sp),


      helperStyle: getRegularStyle(color: ColorsManager.blackColor),
      labelStyle: getMediunStyle(color: ColorsManager.blackColor),
      errorStyle: getRegularStyle(color: ColorsManager.errorColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.borderColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.borderColor1,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
