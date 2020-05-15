import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_messages.dart';
import 'package:flutterapp/resources/app_theme.dart';

class LocationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWhiteStatusBar();
    return Center(child: Text(AppMessages.locationTitle));
  }
}
