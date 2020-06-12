import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon(
      this.iconPath
      );

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    var iconThemeData = IconTheme.of(context)

    return SvgPicture.asset(
      iconPath,
      color: iconThemeData.color,
      width: iconThemeData.size,
      height: iconThemeData.size,
    );
  }
}