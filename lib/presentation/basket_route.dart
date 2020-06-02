import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/widgets/status_bar_safe_area.dart';

class BasketRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBarSafeArea(
      statusBarColor: AppColors.paleGray,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      child: Center(child: Text(AppMessages.basketTitle)),
    );
  }
}
