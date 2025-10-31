import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
    double fontSize,
    String fontFamily,
    FontWeight fontWeight,
    Color color,
    ) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}



// ===== Light Style =====
TextStyle getLightStyle14({
  double fontSize = FontSize.s14,
  FontWeight fontWeight =  FontWeightManager.light300,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    fontWeight,
    color,
  );
}

// ===== Regular Style =====
TextStyle getRegularStyle16({
  double fontSize = FontSize.s16,
  FontWeight fontWeight =  FontWeightManager.regular400,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    fontWeight,
    color,
  );
}

// ===== Medium Style =====
TextStyle getMediumStyle18({
  double fontSize = FontSize.s18,
  FontWeight fontWeight =  FontWeightManager.medium500,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    fontWeight,
    color,
  );
}

// ===== SemiBold Style =====
TextStyle getSemiBoldStyle22({
  double fontSize = FontSize.s22,
  FontWeight fontWeight =  FontWeightManager.semiBold600,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    fontWeight,
    color,
  );
}

// ===== Bold Style =====
TextStyle getBoldStyle32({
  double fontSize = FontSize.s32,
  FontWeight fontWeight =  FontWeightManager.semiBold600,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    fontWeight,
    color,
  );
}
