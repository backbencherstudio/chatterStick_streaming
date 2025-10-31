import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

import '../resource/constansts/color_manger.dart';

class Utils {
  static void showToast({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

  /// Set status bar and navigation bar style based on background brightness
  static void setStatusBarStyle(Color backgroundColor) {
    final brightness = ThemeData.estimateBrightnessForColor(backgroundColor);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: brightness == Brightness.dark
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  static Future<bool> isOnline() async {
    try {
      final result = await Connectivity().checkConnectivity();
      if (result.contains(ConnectivityResult.wifi) ||
          result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.ethernet)) {
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      throw Exception('Couldn\'t check connectivity status: $e');
    }
  }

  static Future<bool?> showErrorToast({required String message}) {
    return Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  static Future<void> selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: ColorManager.whiteColor, // header background
              onPrimary: ColorManager.blackColor, // header text color
              onSurface: ColorManager.whiteColor, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.whiteColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      controller.text =
          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
