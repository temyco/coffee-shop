import 'package:flutter/material.dart';
import 'package:flutterapp/resources/app_messages.dart';

import 'presentation/home_route.dart';
import 'resources/app_theme.dart';

void main() => runApp(CoffeeShop());

class CoffeeShop extends StatelessWidget {
  const CoffeeShop();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppMessages.appTitle,
      theme: mainTheme,
      home: HomeRoute(),
    );
  }
}
