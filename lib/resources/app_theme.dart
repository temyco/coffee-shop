import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/resources/app_font_families.dart';

var mainTheme = ThemeData(
    primaryColor: AppColors.colorWhite,
    accentColor: AppColors.colorBondiWaters,

    /// We should use SFUIDisplay for AppBar title
    fontFamily: AppFontFamilies.SFUIDisplay);

// TODO create color scheme that will match our design
const MaterialColor colorWhite = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

void setStatusBarColor(
  Color statusBarColor, {
  Brightness statusBarIconBrightness = Brightness.dark,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: statusBarIconBrightness,
    ),
  );
}
