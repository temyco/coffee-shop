import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_theme.dart';

class OrdersRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(AppColors.white);
    return Center(child: Text(AppMessages.ordersTitle));
  }
}
