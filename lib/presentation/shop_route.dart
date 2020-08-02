import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/strings/app_localizations.dart';
import 'package:flutterapp/widgets/status_bar_safe_area.dart';

class ShopRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBarSafeArea(
      statusBarColor: AppColors.paleGray,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      child: Center(child: Text(AppLocalizations.of(context).shopTitle)),
    );
  }
}
