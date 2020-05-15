import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';

var mainTheme = ThemeData(
  primaryColor: AppColors.colorWhite,
  accentColor: AppColors.colorBondiWaters,
  /// We should use SFUIDisplay for AppBar title
  fontFamily: 'SFUIDisplay'
);

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