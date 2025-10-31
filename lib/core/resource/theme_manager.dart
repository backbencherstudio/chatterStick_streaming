
import 'package:chatterstick_streaming_app/core/constansts/app_colors.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/values_manager.dart';

import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    //main color of the app====================
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryDark,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.textSecondary, 
    splashColor: ColorManager.primaryDark,

     colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: ColorManager.primaryDark, 
    // Your accent color here
  ),
    //card view them=============================
    cardTheme: CardThemeData(
      color: ColorManager.whiteColor,
      shadowColor: ColorManager.subtitleText,
      elevation: AppSize.s4,
    ),
    //app bar theme======================
    appBarTheme: AppBarTheme(
      centerTitle: true,backgroundColor: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.whiteColor,
      titleTextStyle: getRegularStyle(color: ColorManager.whiteColor,fontSize: FontSize.s16)

    ),
    //Button theme======================
    buttonTheme: ButtonThemeData(shape:StadiumBorder() ,
    
    disabledColor: ColorManager.textSecondary,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.primaryDark
    ),
    //elevated buttom theme============
    elevatedButtonTheme: ElevatedButtonThemeData(
     
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.whiteColor,fontSize: FontSize.s16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      )
    ),
    //
    textTheme: TextTheme(
      headlineLarge: getSemiBoldStyle(color: ColorManager.whiteColor,fontSize: FontSize.s16) ,
      titleMedium: getMediunStyle(color: ColorManager.whiteColor,fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.whiteColor )
      
       
    ),
    //text formfield decoration
    inputDecorationTheme: InputDecorationTheme( 
      contentPadding: EdgeInsets.all(AppPadding.p8),
      helperStyle: getRegularStyle(color: ColorManager.blackColor),
      labelStyle: getMediunStyle(color: ColorManager.blackColor),
      errorStyle: getRegularStyle(color: ColorManager.errorColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.borderColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.borderColor1,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.errorColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.errorColor,width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
        
      ),
    )


  );
  
}