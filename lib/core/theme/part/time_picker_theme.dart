import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTimePickerTheme {
  static TimePickerThemeData timePickerTheme = TimePickerThemeData(
    hourMinuteColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorManager.primary
          : Colors.white;
    }),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorManager.primary;
    }),
    dayPeriodColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorManager.primary
          : Colors.white;
    }),
    dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorManager.primary;
    }),
    backgroundColor: Colors.white,
    dialHandColor: ColorManager.primary,
    helpTextStyle: TextStyle(color: Colors.white),
  );
}
