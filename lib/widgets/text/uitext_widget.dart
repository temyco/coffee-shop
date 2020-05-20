import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_font_families.dart';

class UITextWidget extends Text {
  UITextWidget.style(
    String text,
    TextStyle style,
  ) : super(text, style: style);

  UITextWidget({
    String text,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    double letterSpacing = 0.0,
  }) : super(
          text,
          style: TextStyle(
            fontFamily: AppFontFamilies.SFUIText,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
          ),
        );
}
