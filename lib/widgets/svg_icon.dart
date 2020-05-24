import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
      this.iconPath
      );

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      color: IconTheme.of(context).color,
      width: IconTheme.of(context).size,
      height: IconTheme.of(context).size,
    );
  }
}