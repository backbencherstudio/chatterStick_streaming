// ignore_for_file: deprecated_member_use

import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:flutter/material.dart';

class CustomDatePickerTheme {
  static DatePickerThemeData datePickerTheme = DatePickerThemeData(
    backgroundColor: Colors.white,
    headerBackgroundColor: ColorsManager.primary,
    headerForegroundColor: Colors.white,
    dayForegroundColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else if (states.contains(WidgetState.disabled)) {
        return Colors.grey;
      }
      return ColorsManager.primary;
    }),
    dayBackgroundColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorsManager.primary;
      } else if (states.contains(WidgetState.disabled)) {
        return Colors.grey.shade200;
      }
      return Colors.transparent;
    }),
    todayForegroundColor: WidgetStatePropertyAll(ColorsManager.primary),
    todayBackgroundColor: WidgetStatePropertyAll(
      ColorsManager.primary.withOpacity(0.1),
    ),
    yearForegroundColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorsManager.primary;
    }),
    yearBackgroundColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorsManager.primary
          : Colors.transparent;
    }),
  );
}
