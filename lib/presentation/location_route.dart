import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_text_styles.dart';

class LocationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppMessages.locationTitle, style: AppTextStyles.h1MediumPrimary));
  }
}
