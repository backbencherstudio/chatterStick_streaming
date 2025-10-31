import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:flutter/material.dart';

class CustomTimePickerTheme {
  static TimePickerThemeData timePickerTheme = TimePickerThemeData(
    hourMinuteColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorsManager.primary
          : Colors.white;
    }),
    hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorsManager.primary;
    }),
    dayPeriodColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? ColorsManager.primary
          : Colors.white;
    }),
    dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
      return states.contains(WidgetState.selected)
          ? Colors.white
          : ColorsManager.primary;
    }),
    backgroundColor: Colors.white,
    dialHandColor: ColorsManager.primary,
    helpTextStyle: TextStyle(color: Colors.white),
  );
}
