import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class UITextWidget extends Text {
  UITextWidget(String data, Color color, double fontSize, FontWeight fontWeight)
      : super(data,
            style: TextStyle(
                fontFamily: AppTextStyles.SFUIText,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight));
}
