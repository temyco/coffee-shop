import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class UITextWidget extends Text {
  UITextWidget({
    String text,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing = 0.0,
  }) : super(text,
            style: TextStyle(
              fontFamily: AppTextStyles.SFUIText,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
            ));
}
