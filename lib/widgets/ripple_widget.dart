import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_dimens.dart';

class RippleWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final GestureTapCallback onTap;

  RippleWidget({
    @required this.child,
    this.borderRadius = AppDimens.selectorBorderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap.call();
          }
        },
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        child: child,
      ),
    );
  }
}
