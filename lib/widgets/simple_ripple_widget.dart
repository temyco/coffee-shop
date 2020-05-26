import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';

class SimpleRippleWidget extends StatelessWidget {
  final Widget _child;
  final double _borderRadius;
  final Function() _onTap;

  SimpleRippleWidget(
    this._child,
    this._borderRadius,
    this._onTap,
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: () => _onTap,
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
        child: _child,
      ),
    );
  }
}
