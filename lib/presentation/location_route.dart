import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/resources/app_colors.dart';
import 'package:flutterapp/resources/app_text_styles.dart';
import 'package:flutterapp/resources/strings/app_localizations.dart';
import 'package:flutterapp/widgets/status_bar_safe_area.dart';

class LocationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusBarSafeArea(
      statusBarColor: AppColors.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      child: Center(
        child: Text(
          AppLocalizations.of(context).locationTitle,
          style: AppTextStyles.h1MediumPrimary,
        ),
      ),
    );
  }
}
