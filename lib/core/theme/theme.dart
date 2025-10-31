import 'package:chatterstick_streaming_app/core/theme/part/app_bar_theme.dart';
import 'package:chatterstick_streaming_app/core/theme/part/date_picker_theme.dart';
import 'package:chatterstick_streaming_app/core/theme/part/elevated_button_theme.dart';
import 'package:chatterstick_streaming_app/core/theme/part/input_decoration_theme.dart';
import 'package:chatterstick_streaming_app/core/theme/part/time_picker_theme.dart';
import 'package:chatterstick_streaming_app/core/theme/theme_extension/text_theme.dart';
import 'package:flutter/material.dart';

import '../resource/constansts/color_manger.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primary,
    ),
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,
    scaffoldBackgroundColor: ColorsManager.whiteColor,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.evaluatedButtonTheme,
    textTheme: AppTextTheme.darkTextTheme,
    // colorScheme: AppColors.darkColorScheme,
    timePickerTheme: CustomTimePickerTheme.timePickerTheme,
    datePickerTheme: CustomDatePickerTheme.datePickerTheme,
  );
  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.primary,
    ),
    inputDecorationTheme: AppInputDecorationTheme.inputDecorationTheme,
    scaffoldBackgroundColor: ColorsManager.whiteColor,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.evaluatedButtonTheme,
    textTheme: AppTextTheme.darkTextTheme,
    // colorScheme: AppColors.darkColorScheme,
    timePickerTheme: CustomTimePickerTheme.timePickerTheme,
    datePickerTheme: CustomDatePickerTheme.datePickerTheme,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.whiteColor,
      selectedItemColor: ColorsManager.primary,
      unselectedItemColor: ColorsManager.whiteColor,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showUnselectedLabels: true,
    ),
  );
}
