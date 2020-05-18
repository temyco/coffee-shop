import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class UIDisplayWidget extends Text {
  UIDisplayWidget(String data, Color color, double fontSize, FontWeight fontWeight)
      : super(data,
            style: TextStyle(
                fontFamily: AppTextStyles.SFUIDisplay,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight));
}
