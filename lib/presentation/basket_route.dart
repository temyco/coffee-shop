import 'package:flutter/material.dart';
import 'package:flutterapp/messages.dart';
import 'package:flutterapp/theme.dart';

class BasketRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setWhiteStatusBar();
    return Center(child: Text(Messages.basketTitle));
  }
}
