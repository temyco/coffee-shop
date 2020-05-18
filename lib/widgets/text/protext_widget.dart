import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class ProTextWidget extends Text {
  ProTextWidget(
      String data, Color color, double fontSize, FontWeight fontWeight)
      : super(data,
            style: TextStyle(
                fontFamily: AppTextStyles.SFProText,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight));
}
