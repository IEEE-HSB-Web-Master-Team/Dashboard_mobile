import 'package:dash_board_ieee/core/utils/font_weight_helper.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle styleMostThick24(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle styleMedium13(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 13),
      fontWeight: FontWeight.w500,
    );
  }
  static TextStyle styleBold14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeightHelper.bold,
    );
  }
  static TextStyle styleBold15(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontWeight: FontWeightHelper.bold,
    );
  }
  static TextStyle styleBold16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeightHelper.bold,
    );
  }
  static TextStyle styleBold20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeightHelper.bold,
    );
  }

  static TextStyle styleMostThick18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle styleMostThick16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w900,
    );
  }

  static TextStyle styleBold34(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 34),
      fontWeight: FontWeight.bold,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 550;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
