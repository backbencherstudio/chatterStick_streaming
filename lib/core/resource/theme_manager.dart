import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false, // set true if using Material 3
    // ===== Main colors =====
    primaryColor: ColorsManager.primary,
    primaryColorLight: ColorsManager.primaryLight,
    primaryColorDark: ColorsManager.primaryDark,
    disabledColor: ColorsManager.textSecondary,
    splashColor: ColorsManager.primaryDark,
    scaffoldBackgroundColor: ColorsManager.whiteColor,

    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorsManager.primaryDark,
      error: ColorsManager.errorColor,
    ),

    // ===== Card Theme =====
    cardTheme: CardThemeData(
      color: ColorsManager.whiteColor,
      shadowColor: ColorsManager.subtitleText,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),

    // ===== AppBar Theme =====
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: ColorsManager.primary,
      elevation: AppSize.s4,
      iconTheme: IconThemeData(color: ColorsManager.whiteColor),
      titleTextStyle: getSemiBoldStyle(
        color: ColorsManager.whiteColor,
        fontSize: FontSize.s16,
      ),
    ),

    // ===== Button Theme =====
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorsManager.textSecondary,
      buttonColor: ColorsManager.primary,
      splashColor: ColorsManager.primaryDark,
    ),

    // ===== Elevated Button Theme =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        foregroundColor: ColorsManager.whiteColor,
        textStyle: getRegularStyle(
          color: ColorsManager.whiteColor,
          fontSize: FontSize.s16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p12,
        ),
      ),
    ),

    // ===== Text Theme =====
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(
        color: ColorsManager.blackColor,
        fontSize: FontSize.s20,
      ),
      titleMedium: getMediunStyle(
        color: ColorsManager.blackColor,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getRegularStyle(
        color: ColorsManager.blackColor,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorsManager.subtitleText,
        fontSize: FontSize.s12,
      ),
      labelLarge: getSemiBoldStyle(
        color: ColorsManager.primary,
        fontSize: FontSize.s14,
      ),
    ),

    // ===== Cursor & Selection Colors =====
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primary,
      selectionColor: ColorsManager.primary.withValues(alpha: 0.1),
      selectionHandleColor: ColorsManager.primary,
    ),

    // ===== Input Field Theme =====
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.whiteColor,
      hintStyle: getRegularStyle(color: ColorsManager.textSecondary),
      labelStyle: getMediunStyle(color: ColorsManager.blackColor),
      helperStyle: getRegularStyle(color: ColorsManager.blackColor),
      errorStyle: getRegularStyle(color: ColorsManager.errorColor),
      contentPadding: const EdgeInsets.all(AppPadding.p12),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.borderColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.borderColor1,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorsManager.errorColor,
          width: AppSize.s1_5,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s8),
        ),
      ),
    ),

    // ===== Icon Theme =====
    iconTheme: IconThemeData(
      color: ColorsManager.primary,
      size: AppSize.s24,
    ),
  );
}
