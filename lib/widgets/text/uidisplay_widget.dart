import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_font_families.dart';

class UIDisplayWidget extends Text {

  UIDisplayWidget.style(
        String text,
        TextStyle style,
      ) : super(text, style: style);

  UIDisplayWidget(
      {String text,
      Color color,
      double fontSize,
      FontWeight fontWeight,
      double letterSpacing = 0.0})
      : super(text,
            style: TextStyle(
                fontFamily: AppFontFamilies.SFUIDisplay,
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
                letterSpacing: letterSpacing));
}
