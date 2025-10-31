// ignore_for_file: deprecated_member_use

import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDatePickerTheme {
  static DatePickerThemeData datePickerTheme = DatePickerThemeData(
    backgroundColor: Colors.white,
    headerBackgroundColor: ColorManager.primary,
    headerForegroundColor: Colors.white,
    dayForegroundColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else if (states.contains(WidgetState.disabled)) {
        return Colors.grey;
      }
      return ColorManager.primary;
    }),
    dayBackgroundColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorManager.primary;
      } else if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade200;
      }
      return Colors.transparent;
    }),
    todayForegroundColor: WidgetStatePropertyAll(ColorManager.primary),
    todayBackgroundColor: WidgetStatePropertyAll(
      ColorManager.primary.withOpacity(0.1),
    ),
    yearForegroundColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorManager.primary;
    }),
    yearBackgroundColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorManager.primary
          : Colors.transparent;
    }),
  );
}
